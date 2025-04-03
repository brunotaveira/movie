import 'package:flutter/material.dart';
import 'package:movie/repositories/movie_repository.dart';

import '../../models/movies.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();

  List<Movies> _movies = [];
  bool _isLoading = false;

  List<Movies> get movies => _movies;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    _movies = await _movieRepository.getMovies();
    _isLoading = false;
    notifyListeners();
  }
}
