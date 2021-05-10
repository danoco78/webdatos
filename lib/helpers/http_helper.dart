import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:webdatos/models/movie_response_model.dart';

class HttpHelper {
  static final String key = '?api_key=e23ca5781aa7165ba8d00788359eccf2';
  static final String url = 'https://api.themoviedb.org/3/movie/';
  static final String baseUrlImage = 'https://image.tmdb.org/t/p/w500';

  static Future<MovieResponseModel> getPopular() async {
    final res =
        await http.get(Uri.parse(HttpHelper.url + "popular" + HttpHelper.key));

    if (res.statusCode == HttpStatus.ok) {
      final jsonMap = jsonDecode(res.body);
      final MovieResponseModel movieResponseModel =
          MovieResponseModel.fromJson(jsonMap);
      return movieResponseModel;
    } else {
      return null;
    }
  }
}
