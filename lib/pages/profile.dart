import 'package:flutter/material.dart';
import 'package:chefitup/pages/settings.dart';

class Profile extends StatelessWidget {
  const Profile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey.shade300, // background color of the profile appbar
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // navigates to the settings page on button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/miscimages/defaultprofile.jpg'),
              ),
              const SizedBox(height: 16),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Chef | Food Enthusiast',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoItem(Icons.email, 'john.doe@example.com'),
              _buildInfoItem(Icons.phone, '+1 (555) 123-4567'),
              _buildInfoItem(Icons.location_on, 'Athens, GA'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  // go to edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade200,
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
