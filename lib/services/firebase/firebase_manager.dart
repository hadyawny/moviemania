import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/movie_model.dart';

class FirebaseManager {
  static CollectionReference<Results> getWatchListCollection() {
    return FirebaseFirestore.instance
        .collection("WatchList")
        .withConverter<Results>(
            fromFirestore: (snapshot, _) => Results.fromJson(snapshot.data()!),
            toFirestore: (task, _) => task.toJson());
  }

  static void addMovie(Results movie) {
    var collection = getWatchListCollection();
    var docRef = collection.doc(movie.id.toString());
    docRef.set(movie);
  }

  static void deleteMovie(Results movie) {
    getWatchListCollection().doc(movie.id.toString()).delete();
  }
}
