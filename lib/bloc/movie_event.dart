part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}
class GetMovieEvent extends MovieEvent{
   List<Object> get props => [];

}

class GetMovieEvent1 extends MovieEvent {}

class SearchMovieEvent extends MovieEvent {
  final String searchText;

  SearchMovieEvent(this.searchText);

  List<Object> get props => [searchText];
}
