import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_project/APIs/api_manager.dart';
import 'package:movies_project/models/movieResponse.dart';

import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = 'searchTab';
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  String currentText = "";
  MovieResponse? searchResult;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      final text = searchController.text;
      setState(() {
        currentText = text;
      });
      if (text.isNotEmpty) {
        fetchMovies(text);
      } else {
        setState(() {
          searchResult = null;
        });
      }
    });
  }

  Future<void> fetchMovies(String query) async {
    setState(() {
      isLoading = true;
    });

    final result = await ApiManager.getSearchedMovies(searchedText: query);

    setState(() {
      searchResult = result;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.05,
          left: width * 0.02,
          right: width * 0.02,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.searchtab),
                hintText: AppLocalizations.of(context)!.search,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            if (isLoading)
              CircularProgressIndicator(color: AppColors.primaryColor),

            if (currentText.isEmpty && !isLoading)
              Column(
                children: [
                  SizedBox(height: height * 0.2),
                  Image.asset(AppAssets.imageempty),
                ],
              ),

            if (!isLoading &&
                searchResult != null &&
                searchResult!.data != null &&
                searchResult!.data!.movies != null)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: searchResult!.data!.movies!.length,
                  itemBuilder: (context, index) {
                    final movie = searchResult!.data!.movies![index];
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            movie.largeCoverImage ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  movie.rating?.toStringAsFixed(1) ?? "N/A",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}