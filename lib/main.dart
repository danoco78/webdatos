import 'package:flutter/material.dart';
import 'package:webdatos/helpers/http_helper.dart';

// e23ca5781aa7165ba8d00788359eccf2
// https://api.themoviedb.org/3/movie/550?api_key=e23ca5781aa7165ba8d00788359eccf2
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjNjYTU3ODFhYTcxNjViYThkMDA3ODgzNTllY2NmMiIsInN1YiI6IjYwOGU5YjAwMjBhZjc3MDA1NmZiYjBkYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ywgSBTtGKr2oJAp9OO6cvShEX3RCt_tNQhzF6J3Qs0w

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void myrequest() {
    HttpHelper.getPopular();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    myrequest();

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(title: Text("Datos web")),
          body: Text("Hola"),
        ));
  }
}
