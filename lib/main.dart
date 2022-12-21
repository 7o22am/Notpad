import 'package:asd/Input_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0x0FF0A0E00),
        scaffoldBackgroundColor: Color(0x0FF0A0E00) ,
      ),
      home: input(),


    );
  }
}
