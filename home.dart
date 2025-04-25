import 'package:flutter/material.dart';
import 'details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('University Courses')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CourseCard(
            courseName: 'Flutter Development',
            courseCode: 'CS-101',
            imageUrl:
                'https://cdn-dbghh.nitrocdn.com/QebVtDaNFCEeCVKUoJXTUOHxlyingHVa/assets/images/optimized/rev-69bd0fa/www.minddigital.com/wp-content/uploads/2020/01/ANDROID-APP-DEVELOPMENT-WITH-MIND-DIGITAL.png',
          ),
          SizedBox(height: 16),
          CourseCard(
            courseName: 'Data Structures',
            courseCode: 'CS-102',
            imageUrl: 'https://picsum.photos/300/200?random=2',
          ),
          SizedBox(height: 16),
          CourseCard(
            courseName: 'Machine Learning',
            courseCode: 'CS-103',
            imageUrl: 'https://picsum.photos/300/200?random=3',
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseCode,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CourseDetailsPage(
                    courseName: courseName,
                    courseCode: courseCode,
                    imageUrl: imageUrl,
                  ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: imageUrl,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(imageUrl, height: 150, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    courseCode,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'University Portal',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // Add profile navigation
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Add settings navigation
            },
          ),
        ],
      ),
    );
  }
}
