import 'package:flutter/material.dart';
import 'package:mainproject/editprof.dart';
import 'package:mainproject/freemat.dart';
import 'package:mainproject/logout.dart';

class ProfilePage extends StatelessWidget {
  final String userName;

  const ProfilePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final String initial = userName.isNotEmpty ? userName[0].toUpperCase() : "?";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            child: Text(
              initial,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent,
            radius: 30,
          ),
          const SizedBox(height: 10),
          Text(userName, style: const TextStyle(fontSize: 20)),
          const Text("Organisation Code: "),
          const Divider(height: 30),

          // Use spread operator to inject multiple widgets
          ...[
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Freemat()));
              },
              child: const ProfileTile(title: "Free Material", icon: Icons.folder),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
              },
              child: const ProfileTile(title: "Edit Profile", icon: Icons.person),
            ),
           InkWell(
  onTap: () {
    showDialog(
      context: context,
      builder: (_) => const Logout(), // Use your StatelessWidget here
    );
  },
  child: const ProfileTile(title: 'Logout', icon: Icons.logout),
),
          ],

          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Add your Facebook share logic here
            },
            icon: const Icon(Icons.facebook),
            label: const Text("Share on Facebook"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isNew;

  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: isNew
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'NEW',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
    );
  }}