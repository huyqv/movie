import 'package:flutter/material.dart';
import 'package:movie/data/api.dart';
import 'package:movie/model/trailer.dart';
import 'package:movie/ui/trailer_vm.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/movie.dart';

class TrailerPage extends StatefulWidget {
  Movie movie;

  TrailerPage({super.key, required this.movie});

  @override
  State<StatefulWidget> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  final vm = TrailerVM();

  @override
  void initState() {
    super.initState();
    vm.getTrailerList(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.movie.title}\nTrailers',style: TextStyle(fontSize: 12),)),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: vm.trailerDataList,
          builder: (context, value, child) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                Trailer trailer = value[index];
               return _TrailerItem(trailer: trailer);
              },
            );
          },
        ),
      ),
    );
  }
}

class _TrailerItem extends StatefulWidget {
  Trailer trailer;

  _TrailerItem({required this.trailer});

  @override
  State<StatefulWidget> createState() => _TrailerItemState();
}

class _TrailerItemState extends State<_TrailerItem>{

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var youtubeController = YoutubePlayerController(
      initialVideoId: widget.trailer.key,
      flags: const YoutubePlayerFlags(),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: YoutubePlayer(
          controller: youtubeController,
          onReady: () {},
        ),
      ),
    );
  }

}



