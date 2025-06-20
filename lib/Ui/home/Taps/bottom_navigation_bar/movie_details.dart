import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_project/models/movieSuggestionsResponse.dart';

import '../../../../APIs/api_manager.dart';
import '../../../../models/movieDetailsResponse.dart' as detail;
import '../../../../models/movieResponse.dart';

import 'package:movies_project/models/movieResponse.dart' ;
import 'package:movies_project/models/movieSuggestionsResponse.dart' as suggest;
class MovieDetails extends StatefulWidget {
  static const String routeName = 'movieDetails';
  final String movieId;

  const MovieDetails({super.key, required this.movieId});
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  detail.Movie? movie;
  bool isLoading = true;
  List< suggest.Movies>? suggestedMovies;
  bool isSuggestionsLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovie();
  }

  void fetchMovie() async {
    final movieId = widget.movieId ;
    // final movieId = "658" ;
    if (movieId != null) {
      final response = await ApiManager.getMovieDetails(id: movieId);
      final suggestions = await ApiManager.getMovieSuggestions(id: movieId);

      setState(() {
        movie = response?.data?.movie;
        suggestedMovies = suggestions?.data?.movies ?? [];
        isLoading = false;
        isSuggestionsLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),

      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.55,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, -0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [const Color(0x33121312), const Color(0xFF121312)],
                    ),
                    image: DecorationImage(
                     image: NetworkImage(movie?.mediumCoverImage ??"" ) ,
                      // image: AssetImage(AppAssets.actionBG1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),

              ],
            ),


            SizedBox(height: 12),
            Text(
              movie?.title ?? "" ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(" ${movie?.year}", style: AppStyles.semi14White ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                     "Watch" ,
                      style: AppStyles.semi24White,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.RedColor,
                      minimumSize: Size(width, height * 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatItem(icon: Icons.favorite, label: "${movie?.likeCount}"),
                  StatItem(icon: Icons.access_time, label: "${movie?.runtime}"),
                  StatItem(icon: Icons.star, label: "${movie?.rating}"),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, top: 16),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       "Screen Shots",
            //       style: AppStyles.semi24White,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 8),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(12),
            //       child: Image.asset(
            //         AppAssets.screanShot1,
            //         width: width*0.9,
            //         height: height*0.15,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     SizedBox(height: 12),
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(12),
            //       child: Image.asset(
            //         AppAssets.screanShot1,
            //         width: width*0.9,
            //         height: height*0.15,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     SizedBox(height: 12),
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(12),
            //       child: Image.asset(
            //         AppAssets.screanShot1,
            //         width: width*0.9,
            //         height: height*0.15,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ],
            // ) ,
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Similar",
                  style: AppStyles.semi24White,
                ),
              ),
            ),


            SizedBox(
              //height: height*0.8 , // Set appropriate height for 2 rows
              child: suggestedMovies!.isEmpty ? Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "No Movies Available",
                    style: AppStyles.semi24White,
                  ),
                ),
              )  : GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // prevent scroll if inside another scroll
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemCount: suggestedMovies?.length,
                itemBuilder: (context, index) {
                  return  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                         child :   Image.network(
                           suggestedMovies?[index].mediumCoverImage ?? "",
                           width: double.infinity,
                           height: double.infinity,
                           fit: BoxFit.cover,
                         ),
                        // child: Image.asset(
                        //   AppAssets.imagefilme1,
                        //   width: double.infinity,
                        //   height: double.infinity,
                        //   fit: BoxFit.cover,
                        // ),
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
                                "${suggestedMovies?[index].rating}" ,
                               // "8" ,
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Summary",
                  style: AppStyles.semi24White,
                ),
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  (movie?.descriptionFull?.isEmpty ?? true)
                      ? "No Available Description"
                      : movie!.descriptionFull!
                  ,
                  style: AppStyles.semi14White,
                ),
              ),
            ) ,
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, top: 16),
            //   child: Container(
            //     width: 398,
            //     height: 92,
            //     decoration: ShapeDecoration(
            //       color: const Color(0xFF282A28),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start ,
            //         children: [
            //           Image.asset(
            //             AppAssets.Vector1,
            //             width: width*0.2,
            //             height: height*0.2,
            //             fit: BoxFit.cover,
            //           ),
            //           const SizedBox(width: 12),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start ,
            //             crossAxisAlignment: CrossAxisAlignment.start ,
            //             children: [
            //               Text(
            //                 'Name : Hayley Atwell',
            //                 style: AppStyles.semi20White
            //               ) ,
            //               Text(
            //                 'Character : Captain Carter',
            //                 style: AppStyles.semi20White
            //               )
            //
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ) ,
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Genres",
                  style: AppStyles.semi24White,
                ),
              ),
            ) ,
            SizedBox(height: 20,) ,
            Wrap(
              spacing: 12,       // space between items horizontally
              runSpacing: 12,    // space between items vertically
              children: movie?.genres
                  ?.map(
                    (genre) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282A28),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    genre,
                    style: AppStyles.semi14White,
                  ),
                ),
              )
                  .toList() ??
                  [],
            ) ,
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}

// Widget for the stats row (likes, time, rating)
class StatItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const StatItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 47,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 122,
              height: 47,
              decoration: ShapeDecoration(
                color: const Color(0xFF282A28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 11,
            right: 20,
            child: SizedBox(
              width: 100,
              height: 26.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Icon(icon , color: AppColors.primaryColor , size: 25, ) ,
                   // Spacer() ,
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppStyles.semi24White
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    ) ;
  }
}



