// ignore_for_file: library_private_types_in_public_api, duplicate_ignore

import 'package:flutter/material.dart';
import 'course.dart'; // Import the CoursePage

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashCraft',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CashCraft'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  bool isInvestment = true;

  final List<NavigationItem> navigationItems = [
    HomeNavigationItem(),
    CoinNavigationItem(),
    MessagesNavigationItem(),
    TransactionHistoryNavigationItem(),
    ProfileNavigationItem(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: navigationItems[currentPageIndex].buildPage(context, this),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navigationItems.map((item) {
              return IconButton(
                icon: Icon(item.icon),
                onPressed: () {
                  setState(() {
                    currentPageIndex = navigationItems.indexOf(item);
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildColoredCard(Color color,
      {double width = 100,
      double height = 100,
      String? label,
      IconData? icon}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CoursePage()),
        );
      },
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                if (label != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class NavigationItem {
  IconData get icon;
  // ignore: library_private_types_in_public_api
  Widget buildPage(BuildContext context, _MyHomePageState state);
}

class HomeNavigationItem extends NavigationItem {
  @override
  IconData get icon => Icons.home;

  @override
  // ignore: duplicate_ignore
  // ignore: library_private_types_in_public_api
  Widget buildPage(BuildContext context, _MyHomePageState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommended for You",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle view all action
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 240),
                  state._buildColoredCard(Colors.black, width: 240),
                  state._buildColoredCard(Colors.black, width: 240),
                  state._buildColoredCard(Colors.black, width: 240),
                  state._buildColoredCard(Colors.black, width: 240),
                  state._buildColoredCard(Colors.black, width: 240),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Courses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle view all action
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Because you searched "abc"',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Handpicked just for you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                  state._buildColoredCard(Colors.black, width: 165),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Handpicked just for you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 165),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// investment plan and opperunity
class CoinNavigationItem extends NavigationItem {
  @override
  IconData get icon => Icons.monetization_on;

  @override
  Widget buildPage(BuildContext context, _MyHomePageState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Popular Plans',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                state._buildColoredCard(Colors.black,
                    width: double.infinity, height: 100),
                const SizedBox(height: 10),
                state._buildColoredCard(Colors.black,
                    width: double.infinity, height: 100),
                const SizedBox(height: 10),
                state._buildColoredCard(Colors.black,
                    width: double.infinity, height: 100),
                const SizedBox(height: 10),
                state._buildColoredCard(Colors.black,
                    width: double.infinity, height: 100),
                const SizedBox(height: 10),
                state._buildColoredCard(Colors.black,
                    width: double.infinity, height: 100),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'You might like these',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recomended for you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                  state._buildColoredCard(Colors.black, width: 150),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Chat Page (the only thing left in this entire project is to implement a chatbot and chat function
class MessagesNavigationItem extends NavigationItem {
  @override
  IconData get icon => Icons.message;

  @override
  Widget buildPage(BuildContext context, _MyHomePageState state) {
    final List<Map<String, dynamic>> messages = [
      {'text': 'Hello', 'sender': 'You', 'isMe': true, 'time': '10:00 AM'},
      {'text': 'Hi!', 'sender': 'Alice', 'isMe': false, 'time': '10:01 AM'},
      // Add more messages here
    ];

    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages[index];
              return _buildChatMessage(
                message['text'],
                message['sender'],
                message['isMe'],
                message['time'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    // Add the new message to the list
                    messages.add({
                      'text': controller.text,
                      'sender': 'You',
                      'isMe': true,
                      'time': 'Now', // You can format the current time here
                    });
                    controller.clear();
                    // Update the UI
                    (context as Element).markNeedsBuild();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatMessage(String text, String sender, bool isMe, String time) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              child: Text(sender[0]),
            ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Account Page
class ProfileNavigationItem extends NavigationItem {
  @override
  IconData get icon => Icons.person_rounded;

  @override
  Widget buildPage(BuildContext context, _MyHomePageState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Account Options
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSection(
                  'Personal Information',
                  [
                    _buildListTile(
                      Icons.person_outline,
                      'Edit Profile',
                      () {
                        // Handle edit profile
                      },
                    ),
                    _buildListTile(
                      Icons.location_on_outlined,
                      'Address',
                      () {
                        // Handle address
                      },
                    ),
                  ],
                ),
                _buildSection(
                  'App Settings',
                  [
                    _buildListTile(
                      Icons.notifications_outlined,
                      'Notifications',
                      () {
                        // Handle notifications
                      },
                    ),
                    _buildListTile(
                      Icons.language_outlined,
                      'Language',
                      () {
                        // Handle language
                      },
                    ),
                    _buildListTile(
                      Icons.dark_mode_outlined,
                      'Theme',
                      () {
                        // Handle theme
                      },
                    ),
                  ],
                ),
                _buildSection(
                  'Support',
                  [
                    _buildListTile(
                      Icons.help_outline,
                      'Help Center',
                      () {
                        // Handle help center
                      },
                    ),
                    _buildListTile(
                      Icons.privacy_tip_outlined,
                      'Privacy Policy',
                      () {
                        // Handle privacy policy
                      },
                    ),
                  ],
                ),
              ],
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Handle logout
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// Transactin History
class TransactionHistoryNavigationItem extends NavigationItem {
  @override
  IconData get icon => Icons.history;

  @override
  Widget buildPage(BuildContext context, _MyHomePageState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMonthSection('December', '+ ₹150'),
          _buildTransactionItem('John Doe', '19 December', '+ ₹150'),
          const Divider(),
          _buildMonthSection('November', '+ ₹343.50'),
          _buildTransactionItem('Jane Smith', '18 November', '₹40',
              expired: true),
          _buildTransactionItem('John Doe', '11 November', '+ ₹140'),
          _buildTransactionItem('Jane Smith', '3 November', '+ ₹203.50'),
          const Divider(),
          _buildMonthSection('September', '+ ₹634'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹60'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹500'),
          const Divider(),
          _buildMonthSection('August', '+ ₹700'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹60'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹500'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹60'),
          _buildTransactionItem('John Doe', '13 September', '+ ₹500'),
        ],
      ),
    );
  }

  Widget _buildMonthSection(String month, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            month,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            total,
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String name, String date, String amount,
      {bool expired = false}) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(date),
      trailing: expired
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  amount,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Request expired',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          : Text(
              amount,
              style: const TextStyle(color: Colors.green),
            ),
    );
  }
}
