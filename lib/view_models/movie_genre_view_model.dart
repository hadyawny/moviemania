import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class MovieGenreViewModel extends ChangeNotifier {
  Future<MovieModel> getMovieGenre(String genreID) async {
    var jsonData = await ApiManager.getData(EndPoints.discover,
        {"api_key": Constants.abiKey, "with_genres": genreID});

    MovieModel movieModel = MovieModel.fromJson(jsonData);

    return movieModel;
  }
}
