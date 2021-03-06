import 'package:meta/meta.dart';
import 'package:movielistwithredux/src/models/movie.dart';

@immutable
class AppState {
  const AppState({this.movies = const <Movie>[], this.isLoading = true, this.pageNumber = 1});

  final List<Movie> movies;
  final bool isLoading;
  final int pageNumber;

  AppState copyWith({
    List<Movie>? movies,
    bool? isLoading,
    int? pageNumber,
  }) {
    return AppState(
      movies: movies != null ? List<Movie>.unmodifiable(movies) : this.movies,
      isLoading: isLoading ?? this.isLoading,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  String toString() {
    return 'AppState{movies: $movies, isLoading: $isLoading, pageNumber: $pageNumber}';
  }
}
