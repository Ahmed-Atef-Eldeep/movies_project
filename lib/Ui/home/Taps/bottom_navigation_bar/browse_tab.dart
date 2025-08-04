import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import '../../../../APIs/api_manager.dart';
import '../../../../models/movieResponse.dart';
import 'movie_details.dart';

class BrowseTab extends StatefulWidget {
  static const String routeName = 'browseTab';

  final String genre  ;

  const BrowseTab({super.key,  required this.genre});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}


class _BrowseTabState extends State<BrowseTab> {
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

  int selectedIndex = 0;
  MovieResponse? movieResponse;
  bool isLoading = true;

  @override
  void initState() {
    super.initState() ;
    selectedIndex = genres.indexOf(widget.genre );
    fetchMoviesForSelectedGenre();

  }
Future<void> fetchMoviesForSelectedGenre() async {
  if (!mounted) return;
  setState(() {
    isLoading = true;
  });

  try {
    final response = await ApiManager.getMovies(genre: genres[selectedIndex]);
    
    if (!mounted) return; 
    setState(() {
      movieResponse = response;
      isLoading = false;
    });
  } catch (e) {
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }
}

  // Future<void> fetchMoviesForSelectedGenre() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     final response =
  //     await ApiManager.getMovies(genre: genres[selectedIndex]);
  //     setState(() {
  //       movieResponse = response;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     // handle error
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.05, left: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        fetchMoviesForSelectedGenre();
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
                            genres[index],
                            style: AppStyles.semi20Black.copyWith(
                                color: isSelected
                                    ? AppColors.BlackColor
                                    : AppColors.primaryColor),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: width * 0.04),
                  itemCount: genres.length),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : movieResponse?.data?.movies == null ||
                  movieResponse!.data!.movies!.isEmpty
                  ? const Center(child: Text("No movies found"))
                  : GridView.builder(
                padding: EdgeInsets.only(right: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemCount: movieResponse!.data!.movies!.length,
                itemBuilder: (context, index) {
                  final movie = movieResponse!.data!.movies![index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieId:"${movie.id}",)) ) ;

                          },
                          child: Image.network(
                            movie.largeCoverImage ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,

                          ),
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
                                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
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
