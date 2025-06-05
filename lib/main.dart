import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/HomeScreen.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: OnboardingScreen(),
    );
  }
}