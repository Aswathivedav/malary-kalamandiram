import 'package:flutter/material.dart';
import 'package:mainproject/guitar.dart';
import 'package:mainproject/keyboard.dart';
import 'package:mainproject/mydrawer.dart';
import 'package:mainproject/violine.dart';
import 'package:mainproject/vocal.dart';

void main() {
  runApp(MusicLessonApp());
}

class MusicLessonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Lesson',
      theme: ThemeData.light().copyWith(
        
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 130, 142, 115),
      ),
      themeMode: ThemeMode.system,
      home: MusicHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 400 ? 2 : 3;

    return Scaffold(backgroundColor: const Color.fromARGB(255, 150, 191, 121),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,',
                  style: TextStyle(
                      fontSize: 18, color: isDark ? Colors.grey[300] : Colors.grey[700])),
              Text('Malary Kalamandiram',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Continue Your Lesson',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 4),
                          Text('Carnatic Vocals',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('Lessons',
                              style: TextStyle(color: Colors.grey[600])),
                        ]),
                    Icon(Icons.arrow_forward_ios, size: 16)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text('Music Courses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> Vocal()));
                    },child: courseOption(Icons.music_note_outlined, 'Vocal', isDark)),
                    InkWell(onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (_)=>Keyboard()));
                      
                    },child: courseOption(Icons.piano, 'Keyboard', isDark)),
                    InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Violine()));
                      
                    },child: courseOption(Icons.music_note_sharp, 'Violin', isDark)),
                    InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Guitar()));

                    },child: courseOption(Icons.music_note_rounded, 'Guitar', isDark)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),




       appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 34, 32, 32),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      
      ),
      drawer: Mydrawer(),
    );
  }

  Widget courseOption(IconData icon, String title, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color.fromARGB(255, 96, 88, 88) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: isDark ? Colors.white : const Color.fromARGB(255, 119, 76, 76)),
          SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}