import 'package:flutter/material.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

import '../../models/genres_model.dart';

class BrowseTabViewModel extends ChangeNotifier {
  Future<GenresModel> getGenres() async {
    var jsonData = await ApiManager.getData(
        EndPoints.genre, {"api_key": Constants.abiKey});

    GenresModel genresModel = GenresModel.fromJson(jsonData);

    return genresModel;
  }
}
