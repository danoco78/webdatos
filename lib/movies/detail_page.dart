import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:webdatos/helpers/http_helper.dart';
import 'package:webdatos/models/movie_model.dart';
import 'package:webdatos/widgets/movies/horizontal_movies.dart';

class DetailPage extends StatelessWidget {
  static const ROUTE = '/detail';

  @override
  Widget build(BuildContext context) {
    final MovieModel movie = ModalRoute.of(context).settings.arguments;

    var imageBackdropPath, imagePosterPath;
    movie.backdropPath == null
        ? imageBackdropPath =
            'https://st.depositphotos.com/1144687/2206/i/950/depositphotos_22066349-stock-photo-paper-frames.jpg'
        : imageBackdropPath = HttpHelper.baseUrlImage + movie.backdropPath;
    movie.posterPath == null
        ? imagePosterPath =
            'https://st.depositphotos.com/1144687/2206/i/950/depositphotos_22066349-stock-photo-paper-frames.jpg'
        : imagePosterPath = HttpHelper.baseUrlImage + movie.posterPath;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(imageBackdropPath),
          Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          imagePosterPath,
                          width: 50,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              itemCount: 5,
                              initialRating: movie.voteAverage / 2,
                              itemSize: 30,
                              allowHalfRating: true,
                              itemBuilder: (context, _) {
                                return Icon(
                                  Icons.movie_sharp,
                                  color: Colors.yellow,
                                );
                              },
                              onRatingUpdate: null,
                            ),
                            Text('Calificacion: ' +
                                movie.voteAverage.toStringAsFixed(1)),
                            Text('Votos: ' + movie.voteCount.toString())
                          ],
                        ),
                      )),
                      Text(
                        movie.releaseDate,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Top 15",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ),
                  FutureBuilder(
                    future: HttpHelper.getTop(),
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return HorizontalMovies(
                            movieResponseModel: snapshot.data);
                      }
                      return SizedBox();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
