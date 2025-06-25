import 'package:flutter/material.dart';
import 'package:mainproject/components/mylisttile.dart';

class Mylisttile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const Mylisttile({super.key,
  required this.text,
  required this.icon,
  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ListTile(leading: Icon(icon,color: const Color.fromARGB(255, 36, 27, 27),),
      title: Text(text),
      onTap: onTap,),);
  }
}