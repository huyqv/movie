class Movie {
  final int id;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final List? genre;

  String get imageUrl => 'https://image.tmdb.org/t/p/w500/$posterPath';

  String get backdropUrl => 'https://image.tmdb.org/t/p/w500/$backdropPath';

  Movie({
    required this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.voteAverage = 0,
    this.genre,
  });

  static Movie fromJson(dynamic json) {
    json as Map;
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_date'],
      voteAverage: json['vote_average'],
      genre: json['genre'],
    );
  }
}