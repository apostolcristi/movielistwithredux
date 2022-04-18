import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movielistwithredux/src/actions/get_movies.dart';
import 'package:movielistwithredux/src/data/movie_api.dart';
import 'package:movielistwithredux/src/epics/add_epic.dart';
import 'package:movielistwithredux/src/models/app_state.dart';
import 'package:movielistwithredux/src/presentation/home_page.dart';
import 'package:movielistwithredux/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final Client client = Client();
  final MovieApi movieApi = MovieApi(client);
  final AppEpic epic = AppEpic(movieApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: const AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.getEpics()),
    ],
  )..dispatch(GetMovies());

  runApp(MovieApp(store: store));
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(store: store, child: const MaterialApp(home: HomePage()));
  }
}
