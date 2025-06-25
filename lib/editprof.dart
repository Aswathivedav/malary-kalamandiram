import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController(text: "Aswathy");
  final TextEditingController phoneController = TextEditingController(text: "919745455924");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController dojController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Text('A', style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            const SizedBox(height: 16),

            buildTextField("Name", nameController),
            buildTextField("Mobile Number", phoneController, keyboard: TextInputType.phone),
            buildTextField("Email", emailController),
            buildTextField("About", aboutController),
            buildTextField("Roll Number", rollController),
            buildTextField("Date of Joining", dojController),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated!")),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}