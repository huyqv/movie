import 'package:flutter/material.dart';

import '../data/api.dart';
import '../model/movie.dart';

class MovieVM {
  var api = Api();
  final movieDataList = ValueNotifier<List<Movie>>([]);

  Future getMovieList() async {
    movieDataList.value = await api.getMovies(page: 1);
  }
}