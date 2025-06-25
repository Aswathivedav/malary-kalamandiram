import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 200,
                lineWidth:35,
                percent: 0.4,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "40%",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 30,
                percent: 0.5,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
