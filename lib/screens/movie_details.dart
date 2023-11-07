import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/routes/routes.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/viewmodels/movie_details_view_model.dart';
import 'package:movies_app/widgets/movie_details_card.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dora and the lost city of gold",
            style: fontSmall.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: viewModel.getMovieDetails("609681"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            MovieDetailsModel movieDetailsModel = snapshot.data!;

            return MovieDetailsCard(
              movieDetailsModel: movieDetailsModel,
            );
          },
        ),
      ),
    );
  }
}
