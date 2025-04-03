class Movies {
  final String title;
  final String overview;
  final String posterUrl;

  Movies({
    required this.title,
    required this.overview,
    required this.posterUrl,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      title: json['title'],
      overview: json['overview'],
      posterUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
    );
  }
}
