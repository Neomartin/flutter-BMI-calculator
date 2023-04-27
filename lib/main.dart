import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF040721),
            ),
            iconTheme: const IconThemeData(color: Colors.black54),

            scaffoldBackgroundColor: const Color(0xFF0A0E21)
      ),
      home: const InputPage(),
    );
  }
}


