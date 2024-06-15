// movie_bloc.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie/models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetMovieEvent) {
      yield* _mapGetMovieEventToState();
    }
  }

  Stream<MovieState> _mapGetMovieEventToState() async* {
    try {
      yield MovieLoading();
      final Response response =
          await Dio().get("http://www.omdbapi.com/?apikey=a26c406c&t=spider man");
      final result = MovieModel.fromJson(response.data);
      yield MovieSuccess(model: result,);
    } catch (e) {
      // Обработка ошибки
      print('Error: $e');
      yield MovieError();
    }
  }
}
