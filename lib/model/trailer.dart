class Trailer {
  final String key;
  final String site;

  String get url => site.toLowerCase() == 'youtube' ? 'https://www.youtube.com/watch?v=$key' : 'https://vimeo.com/$key';

  Trailer({
    required this.key,
    required this.site,
  });

  static Trailer fromJson(dynamic json) {
    json as Map;
    return Trailer(
      key: json['key'],
      site: json['site'],
    );
  }
}