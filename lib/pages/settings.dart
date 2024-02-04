import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();

}

class _Settings extends State<Settings> { 
  bool enableNotifications = false;
  bool enableDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Enable or disable notifications'),
              trailing: Switch(
                value: enableNotifications,
                onChanged: (value) {
                  setState(() {
                    enableNotifications = value;
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Enable or disable dark mode'),
              trailing: Switch(
                value: enableDarkMode,
                onChanged: (value) {
                  setState(() {
                    enableDarkMode = value;
                  });
                },
              ),
            ),
            const Divider(),
            // Add more settings here as needed
          ],
        ),
      ),
    );
  }
}