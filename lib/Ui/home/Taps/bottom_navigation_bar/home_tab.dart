import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

import 'GenreSectionWidget.dart';
import 'browse_tab.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = 'homeTab';
  List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'Film-Noir',
    'Game-Show',
    'History',
    'Horror',
    'Music',
    'Musical',
    'Mystery',
    'News',
    'Reality-TV',
    'Romance',
    'Sci-Fi',
    'Short',
    'Sport',
    'Talk-Show',
    'Thriller',
    'War',
    'Western',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List<String> shuffledGenres = List.of(genres)..shuffle(Random());
    final List<String> selectedGenres = shuffledGenres.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppAssets.BackHome,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppAssets.BackBgHome,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.02),
                    Image.asset(
                      AppAssets.AvailableNow,
                      fit: BoxFit.cover,
                      width: width * 0.62,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: width * 0.02),
                          Image.asset(
                            AppAssets.imagefilme1,
                            fit: BoxFit.cover,
                            height: height * 0.27,
                          ),
                          SizedBox(width: width * 0.05),
                          Image.asset(
                            AppAssets.imagefilme2,
                            fit: BoxFit.cover,
                            height: height * 0.37,
                          ),
                          SizedBox(width: width * 0.05),
                          Image.asset(
                            AppAssets.imagefilme3,
                            fit: BoxFit.cover,
                            height: height * 0.27,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppAssets.WatchNow,
                      fit: BoxFit.cover,
                      width: width * 0.82,
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: selectedGenres.map((genre) {
                return GenreSection(
                    genre: genre,
                    title: genre,
                    onSeeMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BrowseTab(genre: genre),
                        ),
                      );
                    });
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
