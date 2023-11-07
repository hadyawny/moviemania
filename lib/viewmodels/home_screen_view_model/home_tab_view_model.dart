import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class HomeTabViewModel extends ChangeNotifier {
  Future<MovieModel> getNewReleases() async {
    var jsonData = await ApiManager.getData(
        EndPoints.upcoming, {"api_key": Constants.abiKey});

    MovieModel movieModel = MovieModel.fromJson(jsonData);

    return movieModel;
  }

  Future<MovieModel> getTopRated() async {
    var jsonData = await ApiManager.getData(
        EndPoints.topRated, {"api_key": Constants.abiKey});

    MovieModel movieModel = MovieModel.fromJson(jsonData);

    return movieModel;
  }

  Future<MovieModel> getPopular() async {
    var jsonData = await ApiManager.getData(
        EndPoints.popular, {"api_key": Constants.abiKey});

    MovieModel movieModel = MovieModel.fromJson(jsonData);

    return movieModel;
  }
}
