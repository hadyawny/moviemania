import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class SearchTabViewModel extends ChangeNotifier {
  Future<SearchModel> getSearchResults(String search) async {

    var jsonData = await ApiManager.getData(
        EndPoints.search, {"api_key": Constants.abiKey,"query":search});

    SearchModel searchModel = SearchModel.fromJson(jsonData);

    return searchModel;
  }
}
