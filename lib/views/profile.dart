import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/settings.dart';
import 'package:get_storage/get_storage.dart';

var store = GetStorage();

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "http://127.0.0.1/discipline/get_image.php?image=${store.read("image")}";

    print("IMAGE URL: $imageUrl");
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            CircleAvatar(
              radius: 55,
              backgroundColor: secondaryColor,
              backgroundImage: NetworkImage(imageUrl),
              onBackgroundImageError: (exception, stackTrace) {
                print("IMAGE ERROR: $exception");
              },
            ),

            const SizedBox(height: 15),
            Text(
              "${store.read("fname")} ${store.read("lname")}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              store.read("email") ?? "",
              style: TextStyle(color: primaryColor),
            ),
            Text(
              store.read("phone") ?? "",
              style: TextStyle(color: primaryColor),
            ),

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
                onPressed: () {},
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
              "18",
              null,
            ),

            buildProfileTile(Icons.check_circle, "Tasks Completed", "10", null),

            buildProfileTile(Icons.emoji_events, "Achievements", "15", null),

            buildProfileTile(Icons.help_outline, "Help & Support", "", null),

            buildProfileTile(Icons.logout, "Log Out", "", () {
              store.erase();
              Navigator.pushReplacementNamed(context, "/");
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildProfileTile(
    IconData icon,
    String title,
    String value,
    VoidCallback? onTap,
  ) {
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
        onTap: onTap,
      ),
    );
  }
}
