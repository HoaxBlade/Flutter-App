//import 'package:experiment_app/interest.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              Container(
                height: 200,
                color: Colors.blueGrey,
                child: const Center(child: Text('Course Image')),
              ),
              const SizedBox(height: 16),
              // Course Title
              const Text(
                'The Complete Android & Kotlin Development Masterclass',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Rating and Reviews
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('4.4 (1,234 ratings)'),
                ],
              ),
              const SizedBox(height: 16),
              // Price and Buy Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '₹399.00',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // What you'll learn
              const Text(
                "What you'll learn",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                  '• Build Android apps with Kotlin\n• Understand Android Studio\n• Master Android development tools'),
              const SizedBox(height: 16),
              // Curriculum
              const Text(
                'Curriculum',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Section ${index + 1}: Introduction'),
                    subtitle: const Text('5 lectures • 30 min'),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Requirements
              const Text(
                'Requirements',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                  '• Basic understanding of programming\n• A computer with internet access'),
              const SizedBox(height: 16),
              // Description
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                  'This course will teach you how to build Android apps using Kotlin.'),
              const SizedBox(height: 16),
              // Instructor
              const Text(
                'Instructor',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Instructor Name'),
                subtitle: Text('Expert in Android Development'),
              ),
              const SizedBox(height: 16),
              // Student Feedback
              const Text(
                'Student Feedback',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('4.4 out of 5'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
