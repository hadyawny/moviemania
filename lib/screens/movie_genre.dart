import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
import '../utils/fonts.dart';
import '../view_models/movie_genre_view_model.dart';
import '../widgets/search_tab_widgets/search_item.dart';

class MovieGenre extends StatefulWidget {
  final Genres args;

  const MovieGenre({super.key, required this.args});

  @override
  State<MovieGenre> createState() => _MovieGenreState();
}

class _MovieGenreState extends State<MovieGenre> {
  MovieGenreViewModel viewModel = MovieGenreViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.args.name.toString()),
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: viewModel.getMovieGenre(widget.args.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'Please Check Your Internet',
                          style: fontSmall,
                        ),
                      ),
                    );
                  }

                  List<Results> searchResults = snapshot.data!.results ?? [];

                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SearchItem(results: searchResults[index]);
                      },
                      itemCount: searchResults.length,
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
