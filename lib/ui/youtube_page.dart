import 'package:flutter/material.dart';
import 'package:movie/data/api.dart';
import 'package:movie/model/trailer.dart';

import '../model/movie.dart';

class YoutubePage extends StatefulWidget {
  String videoId;
  YoutubePage({super.key, required this.videoId});

  @override
  State<StatefulWidget> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(),
      ),
    );
  }
}

class _TrailerVM {
  var api = Api();
  final trailerDataList = ValueNotifier<List<Trailer>>([]);

  Future getTrailerList(int movieId) async {
    trailerDataList.value = await api.getTrailers(movieId: movieId);
  }
}
