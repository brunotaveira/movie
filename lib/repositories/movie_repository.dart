import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movies.dart';

class MovieRepository {
  final String _apiKey = 'ac551b76f26cf1d6ebe1a60986227a6d';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movies>> getMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=pt-BR'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((json) => Movies.fromJson(json)).toList();
    } else {
      throw Exception('ERRO');
    }
  }
}
