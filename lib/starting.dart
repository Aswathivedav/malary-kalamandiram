import 'package:flutter/material.dart';
import 'package:mainproject/Loginnew.dart';
import 'package:mainproject/Registernew.dart';

void main() {
  runApp(Starting());
}

class Starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malary Kalamandiram',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.network(
                "https://images.unsplash.com/photo-1511379938547-c1f69419868d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW5zdHJ1bWVudHxlbnwwfHwwfHx8MA%3D%3D", 
                height: 250,
              ),
              SizedBox(height: 30),
              
              // Title
              Text(
                'Malary Kalamandiram',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              
              // Subtitle
              Text(
                'Discover the joy of music as you grow\nyour skills with expert guidance.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD29A6C), // Custom brown-orange color
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterNew()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginNew()));
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}