import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie/bloc/movie_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onSubmitted: (String text) {
            
            _performSearch(context, text);
          },
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieSucsess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.model.title ?? ""),
                Text(state.model.imdbRating ?? ""),
                Image.network(state.model.poster ?? ""),
              ],
            );
          } else if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      ),
    );
  }

  // Метод для выполнения поиска
  void _performSearch(BuildContext context, String searchText) {
    // Проверяем, что поле ввода не пусто
    if (searchText.isNotEmpty) {
      // Передаем текст в BLoC для выполнения поиска
      BlocProvider.of<MovieBloc>(context).add(SearchMovieEvent(searchText));
    }
  }
}