import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            CircleAvatar(
              radius: 55,
              backgroundColor: secondaryColor,
              child: const Icon(Icons.person, size: 60, color: primaryColor),
            ),
            const SizedBox(height: 15),
            Text(
              "Karen Kiplagat",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "karenkiplagat10@yahoo.com",
              style: TextStyle(color: primaryColor),
            ),
            Text("0712345678", style: TextStyle(color: primaryColor)),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // Navigate to Edit Profile Page later
                },
                icon: const Icon(Icons.edit, color: secondaryColor),
                label: const Text(
                  "Edit Profile",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
            ),

            buildProfileTile(
              Icons.local_fire_department,
              "Current Streak",
              "0",
            ),

            buildProfileTile(Icons.check_circle, "Tasks Completed", "10"),

            buildProfileTile(Icons.emoji_events, "Achievements", "15"),

            buildProfileTile(Icons.settings, "Settings", ""),

            buildProfileTile(Icons.help_outline, "Help & Support", ""),

            buildProfileTile(Icons.logout, "Log Out", ""),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildProfileTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: secondaryColor,
          child: Icon(icon, color: const Color(0xFF2563EB)),
        ),
        title: Text(title),
        trailing: value.isNotEmpty
            ? Text(
                value,
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Add navigation later
        },
      ),
    );
  }
}
