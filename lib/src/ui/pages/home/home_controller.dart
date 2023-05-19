import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../repostories/movie_repository.dart';

class HomeController extends ValueNotifier<List<Movie>> {
  final MovieRepository repository = MovieRepository();

  HomeController() : super([]);

  Future<void> getMovies() async {
    value = await repository.getMovies();
  }

  void addMovie() {
    repository.addMovie(id: "IDAIdasdad", name: "Fime do Wolf");
    getMovies();
  }

  void filter(String type) async {
    value = await repository.getMoviesByPlant(type);
  }
}
