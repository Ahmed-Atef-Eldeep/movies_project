import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/profile/home_profile_tab.dart';
class HomeScreen extends StatelessWidget {
   static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});
   
     // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: HomeProfileTab(),
    );
  }
}