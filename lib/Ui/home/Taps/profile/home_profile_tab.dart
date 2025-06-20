import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/bottom_navigation_bar/browse_tab.dart';
import 'package:movies_project/Ui/home/Taps/bottom_navigation_bar/home_tab.dart';
import 'package:movies_project/Ui/home/Taps/bottom_navigation_bar/profile_tab.dart';
import 'package:movies_project/Ui/home/Taps/bottom_navigation_bar/search_tab.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';

class HomeProfileTab extends StatefulWidget {
  static const String routeName = 'homeProfileTab';
  const HomeProfileTab({super.key});

  @override
  State<HomeProfileTab> createState() => _HomeProfileTabState();
}

class _HomeProfileTabState extends State<HomeProfileTab> {
  int selectedIndex = 0;

  List<Widget> tabsBodyList = [
    HomeTab(),
    SearchTab(),
    BrowseTab(
      genre: "Action",
    ),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.BlackColor,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.BlackBgColor),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.015,
                right: width * 0.015,
                bottom: height * 0.005),
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.WhiteColor,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 0, imageName: AppAssets.hometab),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 1, imageName: AppAssets.searchtab),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 2, imageName: AppAssets.browsetab),
                    label: 'Browse',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 3, imageName: AppAssets.profiletab),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Expanded(child: tabsBodyList[selectedIndex]));
  }

  buildItemInBottomNavBar({required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            child: ImageIcon(AssetImage(imageName)),
          )
        : ImageIcon(AssetImage(imageName));
  }
}
