import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

class BrowseTab extends StatefulWidget {
  static const String routeName = 'browseTab';
  BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  List<String> categories = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
  ];
  Map<String, List<String>> categoryFilmes = {
    'Action': [
      '${AppAssets.actionBG1}',
      '${AppAssets.imagefilme2}',
    ],
    'Adventure': [
      '${AppAssets.actionBG2}',
      '${AppAssets.imagefilme1}',
    ],
    'Animation': [
      '${AppAssets.imagefilme3}',
      '${AppAssets.imageaction3}',
    ],
    'Biography': [
      '${AppAssets.imageaction1}',
      '${AppAssets.imageaction2}',
    ],
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String selctedCategory = categories[selectedIndex];
    List<String> filmes = categoryFilmes[selctedCategory] ?? [];
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.05, left: width * 0.02),
        child: Column(
          children: [
            SizedBox(
              width: width * 0.98,
              height: height * 0.05,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        width: width * 0.33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: AppStyles.semi20Black.copyWith(
                                color: isSelected
                                    ? AppColors.BlackColor
                                    : AppColors.primaryColor),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.04,
                    );
                  },
                  itemCount: categories.length),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Image(image: AssetImage(filmes[index]),fit: BoxFit.cover,);
                  // Container(
                  //   width: width * 0.3,
                  //   margin: EdgeInsets.only(right: width * 0.01),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       image: DecorationImage(
                  //           image: AssetImage(filmes[index]), fit: BoxFit.cover)),
                  // );
                },
                itemCount: filmes.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
