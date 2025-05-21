import 'package:flutter/material.dart';
import 'input.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0D0A21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
