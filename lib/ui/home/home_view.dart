import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                final movie = viewModel.movies[index];
                return ListTile(
                  leading: Image.network(movie.posterUrl),
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
              itemCount: viewModel.movies.length,
            ),
    );
  }
}
