import 'package:flutter/material.dart';
import 'package:mainproject/chatpage.dart';
import 'package:mainproject/components/mylisttile.dart';
import 'package:mainproject/feepage.dart';
import 'package:mainproject/profile.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.voice_chat,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),const SizedBox(height: 25,),
         Mylisttile(text: "fee", icon: Icons.currency_rupee, onTap: () {
           Navigator.push(context,MaterialPageRoute(builder: (_)=> FeePage()));
           
         },),Mylisttile(text: "chat with us", icon: Icons.chat, onTap: () {
           Navigator.push(context,MaterialPageRoute(builder: (_)=> ChatPage()));
           
         },),

         Mylisttile(text: "Profile", icon: Icons.person, onTap: () {
           Navigator.push(context,MaterialPageRoute(builder: (_)=> ProfilePage(userName:"aswathi")));
           
         },)
        ],
      ),
    );
  }
}
