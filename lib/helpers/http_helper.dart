import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:webdatos/models/movie_response.dart';

class HttpHelper {
  static final String key = '?api_key=e23ca5781aa7165ba8d00788359eccf2';
  static final String url = 'https://api.themoviedb.org/3/movie/';

  static Future<MovieResponse> getPopular() async {
    final res =
        await http.get(Uri.parse(HttpHelper.url + "popular" + HttpHelper.key));

    if (res.statusCode == HttpStatus.ok) {
      final jsonMap = jsonDecode(res.body);
      final MovieResponse movieResponse = MovieResponse.fromJson(jsonMap);
      return movieResponse;
    } else {
      return null;
    }
  }
}
