import 'package:flutter/material.dart';
import 'package:webdatos/helpers/http_helper.dart';
import 'package:webdatos/models/movie_response_model.dart';
import 'package:webdatos/movies/detail_page.dart';

class ListPage extends StatefulWidget {
  static const String ROUTE = "/";

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  MovieResponseModel movieResponseModel;
  @override
  void initState() {
    _dataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listado Peliculas"),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: this.movieResponseModel == null
                    ? 0
                    : this.movieResponseModel.movies.length,
                itemBuilder: (_, int position) {
                  var m = this.movieResponseModel.movies[position];

                  var image;
                  if (m.posterPath == null) {
                    NetworkImage(
                        'https://st.depositphotos.com/1144687/2206/i/950/depositphotos_22066349-stock-photo-paper-frames.jpg');
                  } else {
                    //image = Image.network(HttpHelper.baseUrlImage + m.posterPath);
                    image =
                        NetworkImage(HttpHelper.baseUrlImage + m.posterPath);
                  }

                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: image,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(m.title),
                      subtitle: Text(m.releaseDate +
                          ' - ' +
                          m.voteAverage.toString() +
                          '\n' +
                          m.overview),
                      onTap: () {
                        Navigator.pushNamed(context, DetailPage.ROUTE,
                            arguments: m);
                      },
                    ),
                  );
                })));
  }

  _dataList() async {
    movieResponseModel = await HttpHelper.getPopular();
    setState(() {});
  }
}
