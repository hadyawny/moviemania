import 'movie_details_model.dart';

class GenresModel {
  GenresModel({
    this.genres,
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  GenresModel.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  List<Genres>? genres;
  int? statusCode;
  String? statusMessage;
  bool? success;
}
