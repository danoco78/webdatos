import 'package:webdatos/models/movie.dart';

class MovieResponse {
  int page;
  List<Movie> movies;

  MovieResponse(this.page, this.movies);

  MovieResponse.fromJson(Map<String, dynamic> movieResponseMap) {
    this.page = movieResponseMap['page'];
    this.movies = List<Movie>.from(
        movieResponseMap["results"].map((m) => Movie.fromJson(m)));
  }
}
