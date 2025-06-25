import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/Loginnew.dart';
import 'package:mainproject/Registernew.dart';
import 'package:mainproject/chatpage.dart';
import 'package:mainproject/components/mylisttile.dart';
import 'package:mainproject/firebase_options.dart';
import 'package:mainproject/first.dart';
import 'package:mainproject/logout.dart';
import 'package:mainproject/mydrawer.dart';
import 'package:mainproject/paymentpage.dart';
import 'package:mainproject/profile.dart';
import 'package:mainproject/progress.dart';
import 'package:mainproject/starting.dart';
import 'package:mainproject/vocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp
  
  (MalaryKalamandiramApp());
}

class MalaryKalamandiramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Malary Kalamandiram',
   home:Starting(), 
  // ProfilePage(userName: 'aswathi',), 
  routes: {
    '/register': (context) => RegisterNew(),
    '/login': (context) => LoginNew(),
    '/homenew': (context) => MusicLessonApp(),
    'chat': (context) => const ChatPage(),
    '/profile': (context) => const ProfilePage(userName: 'aswathi',),
    'payment': (context) =>  PaymentPage(onSuccess: () {},),
     '/logout': (context) => const Logout(),
  },
);
  }
}