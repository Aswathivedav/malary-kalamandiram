import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
        ),
        TextButton(
          child: const Text('Logout'),
          onPressed: () async {
            Navigator.of(context).pop(); // Close dialog
            await FirebaseAuth.instance.signOut(); // Firebase sign out
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login',
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}