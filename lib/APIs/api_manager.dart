import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_project/APIs/api_points.dart';
import '../models/movieDetailsResponse.dart';
import '../models/movieResponse.dart';
import '../models/movieSuggestionsResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<MovieResponse?> getMovies({String? genre}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      endPoints.movieList,
      {
        if (genre != null) 'genre': genre,
      },
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MovieResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return null;
    }
  }

  static Future<MovieResponse?> getSearchedMovies( {String? searchedText}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      endPoints.movieList,
      {'query_term': searchedText},
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        return MovieResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  static Future<MovieDetailsResponse?> getMovieDetails({String? id}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      endPoints.movieDetails,
      {
        if (id != null) 'movie_id': id,
      },
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MovieDetailsResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return null;
    }
  }

  static Future<MovieSuggestionsResponse?> getMovieSuggestions({String? id}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      endPoints.movieSuggest,
      {
        if (id != null) 'movie_id': id,
      },
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MovieSuggestionsResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return null;
    }
  }

}

