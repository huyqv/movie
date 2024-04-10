import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../model/trailer.dart';

class Api {
  final String _apiKey = '56f5e319e84a07d8554121a6f5e963a8';

  final Dio dio = Dio()
    ..options = BaseOptions(
      contentType: 'application/json',
      baseUrl: 'https://api.themoviedb.org/3/',
    );

  Future<List<Movie>> getMovies({required int page}) async {
    try {
      var response = await dio.get(
        'movie/popular',
        queryParameters: {
          'api_key': _apiKey,
          'region': 'US',
          'page': 1,
        },
      );
      var data = response?.data as Map?;
      var result = data?['results'] as List;
      return result.map((e) => Movie.fromJson(e)).toList();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Trailer>> getTrailers({required int movieId}) async {
    try {
      var response = await dio.get(
        'movie/$movieId/videos',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
        },
      );
      var data = response?.data as Map?;
      var result = data?['results'] as List;
      return result.map((e) => Trailer.fromJson(e)).toList();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
