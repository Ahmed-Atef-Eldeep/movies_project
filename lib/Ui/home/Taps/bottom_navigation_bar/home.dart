import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Colors.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(
      //     canvasColor: AppColors.BlackBgColor,
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: AppColors.BlackBgColor,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Image.asset('assets/images/home_tab.png'),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Image.asset('assets/images/browse_tab.png'),
      //         label: 'Browse',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Image.asset('assets/images/search_tab.png'),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Image.asset('assets/images/Profile_tab.png'),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}