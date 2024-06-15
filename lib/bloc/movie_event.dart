part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {
  const MovieEvent();
}

class GetMovieEvent extends MovieEvent {
  const GetMovieEvent();

  List<Object> get props => [];
}

class SearchMovieEvent extends MovieEvent {
  final String searchTerm;

  const SearchMovieEvent(this.searchTerm);

  List<Object> get props => [searchTerm];
}
