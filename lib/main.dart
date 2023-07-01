import 'package:flutter/material.dart';
import 'inputPage.dart';
import 'resultPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme data
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
          primaryColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFEA1556))),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage('','',''),
      },
    );
  }
}
