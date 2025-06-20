import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../APIs/api_manager.dart';
import '../../../../Utils/App Colors.dart';
import '../../../../Utils/App Styles.dart';
import '../../../../models/movieResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenreSection extends StatelessWidget {
  final String genre;
  final String title;
  final VoidCallback? onSeeMore;

  const GenreSection({
    super.key,
    required this.genre,
    required this.title,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder<MovieResponse?>(
      future: ApiManager.getMovies(genre: genre),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data?.data?.movies == null) {
          return const Text("No movies found.");
        }

        final movies = snapshot.data!.data!.movies!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppStyles.semi20White),
                  TextButton(
                    onPressed: onSeeMore,
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context)!.seemore,
                            style: AppStyles.semi16Primary),
                        const Icon(Icons.arrow_forward_outlined,
                            color: AppColors.primaryColor, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: width * 0.03),
                  ...movies.map((movie) => Padding(
                        padding: EdgeInsets.only(right: width * 0.03),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            movie.mediumCoverImage ?? "",
                            width: width * 0.35,
                            height: height * 0.2,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        );
      },
    );
  }
}
