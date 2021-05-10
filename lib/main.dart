import 'package:flutter/material.dart';
import 'package:webdatos/movies/detail_page.dart';
import 'package:webdatos/movies/list_page.dart';

// e23ca5781aa7165ba8d00788359eccf2
// https://api.themoviedb.org/3/movie/550?api_key=e23ca5781aa7165ba8d00788359eccf2
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjNjYTU3ODFhYTcxNjViYThkMDA3ODgzNTllY2NmMiIsInN1YiI6IjYwOGU5YjAwMjBhZjc3MDA1NmZiYjBkYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ywgSBTtGKr2oJAp9OO6cvShEX3RCt_tNQhzF6J3Qs0w

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Peliculas',
        initialRoute: ListPage.ROUTE,
        routes: {
          ListPage.ROUTE: (_) => ListPage(),
          DetailPage.ROUTE: (_) => DetailPage()
        });
  }
}
