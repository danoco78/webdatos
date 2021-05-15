import 'package:flutter/material.dart';
import 'package:webdatos/helpers/http_helper.dart';
import 'package:webdatos/models/movie_response_model.dart';

class ListPage extends StatefulWidget {
  static const String ROUTE = "/";

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Widget> widgetMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listado Peliculas"),
        ),
        body: Container(
          child: FutureBuilder(
            future: _dataList(),
            builder: (_, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: this.widgetMovies.length,
                  itemBuilder: (_, int position) {
                    return this.widgetMovies[position];
                  });
            },
          ),
        ));
  }

  Future<List<Widget>> _dataList() async {
    final MovieResponseModel movieResponseModel =
        await HttpHelper.getPopular(1);

    widgetMovies = movieResponseModel.movies.map((m) {
      var image;
      if (m.posterPath == null) {
        NetworkImage(
            'https://st.depositphotos.com/1144687/2206/i/950/depositphotos_22066349-stock-photo-paper-frames.jpg');
      } else {
        //image = Image.network(HttpHelper.baseUrlImage + m.posterPath);
        image = NetworkImage(HttpHelper.baseUrlImage + m.posterPath);
      }

      return Card(
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: image,
          ),
          title: Text(m.title),
        ),
      );
    }).toList();

    return widgetMovies;
  }
}
