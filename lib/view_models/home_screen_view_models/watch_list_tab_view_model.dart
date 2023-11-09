import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/services/firebase/firebase_manager.dart';

import '../../models/movie_model.dart';

class WatchListTabViewModel extends ChangeNotifier {
  Stream<QuerySnapshot<Results>> getMovie() {
    return FirebaseManager.getWatchListCollection().snapshots();
  }
}
