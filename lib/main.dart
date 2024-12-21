import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
