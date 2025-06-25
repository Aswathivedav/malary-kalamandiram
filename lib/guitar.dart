import 'package:flutter/material.dart';
import 'package:mainproject/mydrawer.dart';

class Guitar extends StatelessWidget {
  const Guitar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(0, 209, 198, 198),elevation: 0,foregroundColor:
      Theme.of(context).colorScheme.inversePrimary,title: const Text("GUITAR",selectionColor: Colors.red,),),
      drawer:Mydrawer(),
    );
  }
}