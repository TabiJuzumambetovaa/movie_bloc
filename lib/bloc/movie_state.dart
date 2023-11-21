part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
final class MovieLoading extends MovieState {}
final class MovieSucsess extends MovieState {
  final MovieModel model;
  MovieSucsess({required this.model});
}
final class MovieError extends MovieState {}
