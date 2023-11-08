import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  Future<MovieDetailsModel> getMovieDetails(String movieID) async {
    var jsonData = await ApiManager.getData(
        EndPoints.movieDetails + movieID, {"api_key": Constants.abiKey});

    MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson(jsonData);

    return movieDetailsModel;
  }

  Future<MovieModel> getSemilarMovies(String movieID) async {
    var jsonData = await ApiManager.getData(
        EndPoints.movieDetails + movieID + EndPoints.similar,
        {"api_key": Constants.abiKey});

    MovieModel movieModel = MovieModel.fromJson(jsonData);

    return movieModel;
  }
}
