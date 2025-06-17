import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_project/APIs/api_points.dart';
import '../models/movieResponse.dart';
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
}
