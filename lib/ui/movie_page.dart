import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/api.dart';
import 'package:movie/ui/trailer_page.dart';

import '../model/movie.dart';
import 'movie_vm.dart';

class MoviePage extends StatefulWidget {
  MoviePage({super.key});

  @override
  State<StatefulWidget> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final vm = MovieVM();

  @override
  void initState() {
    super.initState();
    vm.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: vm.movieDataList,
          builder: (context, value, child) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 250 / 350,
              ),
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                Movie movie = value[index];
                return GestureDetector(
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) {
                        return TrailerPage(movie: movie);
                      },
                    ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}


