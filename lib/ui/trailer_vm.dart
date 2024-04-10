import 'package:flutter/material.dart';

import '../data/api.dart';
import '../model/trailer.dart';

class TrailerVM {
  var api = Api();
  final trailerDataList = ValueNotifier<List<Trailer>>([]);

  Future getTrailerList(int movieId) async {
    trailerDataList.value = await api.getTrailers(movieId: movieId);
  }
}