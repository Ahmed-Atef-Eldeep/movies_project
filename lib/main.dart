import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/HomeScreen.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%201.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%202.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%203.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%204.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%205.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%206.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      initialRoute: OnboardingScreen1.routeName,
      routes: {
        OnboardingScreen1.routeName: (context) =>  OnboardingScreen1(),
        OnboardingScreen2.routeName: (context) =>  OnboardingScreen2(),
         OnboardingScreen3.routeName: (context) => OnboardingScreen3(),
         OnboardingScreen4.routeName: (context) => OnboardingScreen4(),
         OnboardingScreen5.routeName: (context) => OnboardingScreen5(),
         OnboardingScreen6.routeName: (context) => OnboardingScreen6(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}