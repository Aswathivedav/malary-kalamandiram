import 'package:flutter/material.dart';
import 'package:mainproject/mydrawer.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(0, 197, 170, 170),elevation: 0,foregroundColor:
      Theme.of(context).colorScheme.inversePrimary,title: const Text("KEYBOARD"),),
      drawer:Mydrawer(),
    );
  }
}