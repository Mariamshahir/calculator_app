import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basics",
      debugShowCheckedModeBanner: false,
      routes: {
        CalculatorScreen.routeName: (_) => CalculatorScreen()
      },
      initialRoute: CalculatorScreen.routeName,
      // home: HomeScreen(),
    );
  }
}
