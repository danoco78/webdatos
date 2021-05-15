import 'package:webdatos/helpers/http_helper.dart';

class MovieModel {
  int id;
  String title;
  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  String genreIds;
  String originalTitle;
  String originalLanguage;
  String backdropPath;
  double popularity;
  int voteCount;
  double voteAverage;

  MovieModel(
      {this.id,
      this.title,
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.originalTitle,
      this.originalLanguage,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.voteAverage});

  MovieModel.fromJson(Map<String, dynamic> movieMap) {
    this.id = movieMap['id'];
    this.title = movieMap['title'];
    this.posterPath = movieMap['poster_path'];
    this.adult = movieMap['adult'];
    this.overview = movieMap['overview'];
    this.releaseDate = movieMap['release_date'] == null
        ? "Sin fecha"
        : movieMap['release_date'];
    this.genreIds = movieMap['genreIds'];
    this.originalTitle = movieMap['original_title'];
    this.originalLanguage = movieMap['original_language'];
    this.backdropPath = movieMap['backdrop_path'];
    this.popularity = movieMap['popularity'] + .0;
    this.voteCount = movieMap['vote_count'];
    this.voteAverage = double.parse(movieMap['vote_average'].toString());
  }

  getImagePoster() {
    if (this.posterPath == null) {
      return 'https://st.depositphotos.com/1144687/2206/i/950/depositphotos_22066349-stock-photo-paper-frames.jpg';
    }

    return HttpHelper.baseUrlImage + this.posterPath;
  }
}
