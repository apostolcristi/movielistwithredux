import 'package:movielistwithredux/src/models/movie.dart';

class GetMovies {
  GetMovies();

  @override
  String toString() {
    return 'GetMovies{page: }';
  }
}

class GetMoviesSuccessful {
  GetMoviesSuccessful(this.movies);
  final List<Movie> movies;

  @override
  String toString() {
    return 'GetMoviesSuccessful{movies: $movies}';
  }
}

class GetMoviesError {
  GetMoviesError(this.error);

  @override
  String toString() {
    return 'GetMoviesError{error: $error}';
  }

  final Object error;
}
