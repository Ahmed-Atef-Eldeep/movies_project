import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_project/APIs/api_points.dart';
import 'package:movies_project/Utils/App%20Assets.dart';

import 'package:movies_project/models/loginResponse.dart';
import 'package:movies_project/models/registerResponse.dart';
import '../models/movieDetailsResponse.dart';
import '../models/movieResponse.dart';
import '../models/movieSuggestionsResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static RegisterResponse? registerResponse;
  
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

  static Future<MovieResponse?> getSearchedMovies(
      {String? searchedText}) async {
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

  static Future<MovieSuggestionsResponse?> getMovieSuggestions(
      {String? id}) async {
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

  static Future<LoginResponse?> login({String? email, String? password}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl2,
      endPoints.login,
    );
      print("📡 Calling login API: $url");


    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      print("Status: ${response.statusCode}");
      print("Response body: ${response.body}");
      
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return LoginResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e , stack) {
      // print("Exception occurred: $e");
      // return null;
        print("❌ Exception occurred in login(): $e");
  print("📛 Stack trace: $stack");
  return null;
    }
  }

  static Future<RegisterResponse?> register(
      {String? email,
      String? password,
      String? confirmPassword,
      String? name,
      String? phone,
      int? avatarId}) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl2,
      endPoints.register,
    );

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
          'avaterId': avatarId,
          'confirmPassword': confirmPassword,
        }),
        
      );
      print("Status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Selected avatarId: $avatarId");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        registerResponse = RegisterResponse.fromJson(json);
        return registerResponse;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return null;
    }
  }
   static String getImageProfile(int? avatarId) {
    if (avatarId == null) {
      return AppAssets.Vector1;
    }
    switch (avatarId) {
      case 1:
        return AppAssets.Vector1;
      case 2:
        return AppAssets.Vector2;
      case 3:
        return AppAssets.Vector3;
      default:
        return AppAssets.Vector1; 
    }
  }
  
}
