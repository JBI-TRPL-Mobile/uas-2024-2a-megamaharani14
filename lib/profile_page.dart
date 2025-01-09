import 'package:flutter/material.dart';
import 'package:template_project/home_screen_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                const SectionHeader(title: "Video Preference"),
                const SettingsItem(title: "Download Option"),
                const SettingsItem(title: "Video Playback Options"),
                const SectionHeader(title: "Account Settings"),
                const SettingsItem(title: "Account Security"),
                const SettingsItem(title: "Email Notification Preferences"),
                const SettingsItem(title: "Learning Reminders"),
                const SectionHeader(title: "Account Settings"),
                const SettingsItem(title: "About Learnout"),
                const SettingsItem(title: "Frequently Asked Questions"),
                const SettingsItem(title: "Share the Learnout App"),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("Log Out"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
       bottomNavigationBar: navigasi(),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;

  const SettingsItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle navigation
      },
    );
  }
}

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Log Out"),
      content: const Text("Log Out from Learnout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Handle logout logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text("Log Out"),
        ),
      ],
    );
  }
}