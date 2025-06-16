import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ProfileScreen { watchList, histoy }

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profileTab';
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  ProfileScreen selectedTab = ProfileScreen.watchList;

  List<String> categories = [
    'Watch List',
    'History',
  ];

  Map<String, List<String>> categoryFilmes = {
    'Watch List': [
      '${AppAssets.actionBG1}',
      '${AppAssets.imagefilme2}',
    ],
    'History': [
      '${AppAssets.actionBG2}',
      '${AppAssets.imagefilme1}',
    ],
  };

  int selectedIndex = 0;

  // bool isselected;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.05, left: width * 0.03, right: width * 0.03),
            color: AppColors.BlackBgColor,
            width: width,
            height: height * 0.4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.Vector1),
                    Column(
                      children: [
                        Text(
                          '12',
                          style: AppStyles.semi20White,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          AppLocalizations.of(context)!.wishlist,
                          style: AppStyles.semi24White
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '10',
                          style: AppStyles.semi20White,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          AppLocalizations.of(context)!.history,
                          style: AppStyles.semi24White
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'John Safwat',
                      style: AppStyles.semi20White
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.edit_profile,
                        style: AppStyles.semi20Black,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          minimumSize: Size(width * 0.58, height * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.exit,
                            style: AppStyles.semi20White,
                          ),
                          SizedBox(
                            width: width * 0.025,
                          ),
                          Icon(
                            Icons.exit_to_app_sharp,
                            color: AppColors.WhiteColor,
                            size: 19,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.RedColor,
                          minimumSize: Size(width * 0.3, height * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = ProfileScreen.watchList;
                            });
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.list,
                                size: width * 0.1,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                AppLocalizations.of(context)!.watch_list,
                                style: AppStyles.semi20White.copyWith(
                                  color: selectedTab == ProfileScreen.watchList
                                      ? AppColors.primaryColor
                                      : AppColors.WhiteColor,
                                ),
                              ),
                              Divider(
                                color: AppColors.primaryColor,
                                endIndent: width * 0.02,
                                indent: width * 0.02,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.BlackBgColor,
                              minimumSize: Size(width * 0.45, height * 0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTab = ProfileScreen.histoy;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.folder,
                            size: height * 0.04,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            AppLocalizations.of(context)!.history,
                            style: AppStyles.semi20White.copyWith(
                              color: selectedTab == ProfileScreen.watchList
                                  ? AppColors.WhiteColor
                                  : AppColors.primaryColor,
                            ),
                          ),
                          Divider(
                            color: AppColors.primaryColor,
                            thickness: 3,
                            endIndent: width * 0.02,
                            indent: width * 0.02,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.BlackBgColor,
                          minimumSize: Size(width * 0.45, height * 0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    )
                  ],
                ),
                // SizedBox(
                //   height: height * 0.005,
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         color: AppColors.primaryColor,
                //         thickness: 3,
                //         endIndent: width * 0.02,
                //         indent: width * 0.02,
                //       ),
                //     ),
                //     Expanded(
                //       child: Divider(
                //         color: isselected
                //             ? AppColors.BlackColor
                //             : AppColors.primaryColor,
                //         thickness: 3,
                //         indent: width * 0.02,
                //         endIndent: width * 0.02,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Divider(
            color: AppColors.primaryColor,
            thickness: 3,
            endIndent: width * 0.02,
            indent: width * 0.02,
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: height * 0.16),
          //   child: Image.asset(
          //     AppAssets.imageempty,
          //   ),
          // ),
          SizedBox(height: height * 0.02,),
          Expanded(child: 
          selectedTab == ProfileScreen.watchList ? buildWatchList(): buildHistoryList()),
      
        ],
      ),
    );
  }
}

Widget buildWatchList() {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    padding: EdgeInsets.all(8),
    children: [
      Image.asset(AppAssets.actionBG1),
      Image.asset(AppAssets.actionBG2),
      Image.asset(AppAssets.imageaction1),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
    ],
  );
}
Widget buildHistoryList() {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    padding: EdgeInsets.all(8),
    children: [
      Image.asset(AppAssets.imageaction2),

      Image.asset(AppAssets.imageaction3),
      Image.asset(AppAssets.imagefilme2),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
      Image.asset(AppAssets.imagefilme3),
    ],
  );
}
