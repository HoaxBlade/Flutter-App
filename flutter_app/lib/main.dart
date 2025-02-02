import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart'; // UI-related code
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:geolocator/geolocator.dart'; // For accessing the device's location
import 'package:flutter_spinkit/flutter_spinkit.dart'; // For loading spinner animation

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  bool isLoading = true; // To manage loading state
  Map<String, dynamic>? weatherData; // To store weather data
  String? errorMessage; // To store error messages

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather data when the screen loads
  }

  // Fetch the weather data
  Future<void> _fetchWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Get the current location of the user
      Position position = await getCurrentLocation();
      // Fetch weather data from OpenWeatherMap API
      final data = await getWeather(position.latitude, position.longitude);

      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  // Function to get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // Get the user's current position
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Function to fetch weather data from OpenWeatherMap API using your API key
  Future<Map<String, dynamic>> getWeather(double lat, double lon) async {
    const String apiKey =
        'bf5945787401f51daf7ce7f1fe7a2779'; // Your OpenWeatherMap API Key
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

    // Send the HTTP GET request
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Return the JSON data
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: isLoading
          ? const Center(
              child: SpinKitFadingCircle(
                // Loading spinner while fetching data
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : errorMessage != null
              ? Center(child: Text(errorMessage!)) // Show error message if any
              : RefreshIndicator(
                  onRefresh: _fetchWeather, // Pull to refresh
                  child: weatherData != null
                      ? ListView(
                          padding: const EdgeInsets.all(20),
                          children: [
                            Text(
                              '${weatherData!['name']}', // City name
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${weatherData!['main']['temp']}°C', // Temperature
                              style: const TextStyle(fontSize: 48),
                            ),
                            const SizedBox(height: 10),
                            Image.network(
                              'http://openweathermap.org/img/w/${weatherData!['weather'][0]['icon']}.png', // Weather icon
                              scale: 0.25,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${weatherData!['weather'][0]['description']}', // Weather description
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Humidity: ${weatherData!['main']['humidity']}%', // Humidity
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Wind Speed: ${weatherData!['wind']['speed']} m/s', // Wind speed
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      : const Center(
                          child:
                              Text('No weather data')), // If no data available
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchWeather, // Manual refresh button
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
