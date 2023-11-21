import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:search_movie/models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>((event, emit) async {
      try{
        emit(MovieLoading());
        final Response response=await Dio().get("http://www.omdbapi.com/?apikey=a26c406c&t=spider man");
        final result =MovieModel.fromJson(response.data);
        emit(MovieSucsess(model: result));
      }catch(e){

      }
    });
  }
}
// movie_bloc.dart





