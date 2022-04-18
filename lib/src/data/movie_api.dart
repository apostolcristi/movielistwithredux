import 'dart:convert';

import 'package:http/http.dart';
import 'package:movielistwithredux/src/models/movie.dart';

class MovieApi {
  const MovieApi(this._client);

  final Client _client;

  Future<List<Movie>> getMovies(int page) async {
    final Response response =
        await _client.get(Uri.parse('https://yts.torrentbay.to/api/v2/list_movies.json?quality=3D&page=$page'));

    final Map<String, dynamic> result = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> movieList = result['data'] as Map<String, dynamic>;
    final List<dynamic> movies = movieList['movies'] as List<dynamic>;

    final List<Movie> data = <Movie>[];
    for (int i = 0; i < movies.length; i++) {
      final Map<String, dynamic> item = movies[i] as Map<String, dynamic>;
      data.add(Movie.fromJSON(item));
    }
    return data;
  }
}
