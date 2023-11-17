import 'package:flutter/material.dart';
import 'package:movies_app/models/actor_details_model.dart';
import 'package:movies_app/models/combined_credits_model.dart';
import 'package:movies_app/services/api/api_manager.dart';
import 'package:movies_app/services/api/end_points.dart';
import 'package:movies_app/utils/constants.dart';

class ActorDetailsViewModel extends ChangeNotifier {
  Future<ActorDetailsModel> getActorDetails(String actorID) async {
    var jsonData = await ApiManager.getData(
        EndPoints.actorDetails + actorID, {"api_key": Constants.abiKey});

    ActorDetailsModel actorDetailsModel = ActorDetailsModel.fromJson(jsonData);

    return actorDetailsModel;
  }

  Future<CombinedCreditsModel> getKnownFor(String actorID) async {
    var jsonData = await ApiManager.getData(
        EndPoints.actorDetails + actorID + EndPoints.combinedCredits,
        {"api_key": Constants.abiKey});

    CombinedCreditsModel combinedCreditsModel = CombinedCreditsModel.fromJson(jsonData);

    return combinedCreditsModel;
  }


}
