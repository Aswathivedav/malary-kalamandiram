import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mainproject/Loginnew.dart';

class RegisterNew extends StatefulWidget {
  @override
  _RegisterNewState createState() => _RegisterNewState();
}

class _RegisterNewState extends State<RegisterNew> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _sexController = TextEditingController();
  final _usernameController = TextEditingController(); // (Stored locally or as email prefix)
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() => _isLoading = true);

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // You can store other details in Firestore if needed.

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful! Please login.")),
      );

      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginNew()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
           "https://media.istockphoto.com/id/887302650/photo/teenage-students-studying-percussion-in-music-class.jpg?s=2048x2048&w=is&k=20&c=i10adNrFJirHjDB11P1E4YG4qlhXoraRKMo392PkvQY=", // Make sure image is in assets
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              width: 350,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Register as Student", style: TextStyle(fontSize: 22)),
                    SizedBox(height: 15),
                    TextField(
                      controller: _fullNameController,
                      decoration: InputDecoration(labelText: "Full Name"),
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: "Phone Number"),
                      keyboardType: TextInputType.phone,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Email ID"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: _sexController,
                      decoration: InputDecoration(labelText: "Sex"),
                    ),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _register,
                            child: Text("Register"),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}