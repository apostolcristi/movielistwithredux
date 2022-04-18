import 'package:flutter/foundation.dart';
import 'package:movielistwithredux/src/actions/get_movies.dart';
import 'package:movielistwithredux/src/models/app_state.dart';
import 'package:movielistwithredux/src/models/movie.dart';
import 'package:redux/redux.dart';

AppState reducer(AppState state, dynamic action) {
  if (kDebugMode) {
    print(action);
  }
  final AppState newState = _reducer(state, action);
  if (kDebugMode) {
    print(newState);
  }
  return newState;
}

Reducer<AppState> _reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesSuccessful>(_getMovieSuccessful),
  TypedReducer<AppState, GetMoviesError>(_getMovieError),
  TypedReducer<AppState, GetMovies>(_getMovie),
]);

AppState _getMovieSuccessful(AppState state, GetMoviesSuccessful action) {
  return state
      .copyWith(movies: <Movie>[...state.movies, ...action.movies], isLoading: false, pageNumber: state.pageNumber + 1);
}

AppState _getMovieError(AppState state, GetMoviesError action) {
  return state.copyWith(isLoading: false);
}

AppState _getMovie(AppState state, GetMovies action) {
  return state.copyWith(isLoading: true);
}
