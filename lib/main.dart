import 'package:bmicalculator/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1D2136),
        ),
        scaffoldBackgroundColor: Color(0xFF1D2145),
      ),
      home: InputPage(),
    );
  }
}
