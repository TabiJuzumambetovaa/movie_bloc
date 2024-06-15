// movie_state.dart
part of 'movie_bloc.dart';

@immutable
abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  List<Object> get props => [];
}

class MovieSuccess extends MovieState {
  final MovieModel model; // изменение на исходное имя

  const MovieSuccess({required this.model}); // изменение на исходное имя

  List<Object> get props => [model];
}

class MovieError extends MovieState {
  List<Object> get props => [];
}
