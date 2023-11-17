import 'package:movies_app/models/movie_model.dart';

class SearchModel {
  SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  SearchModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  num? statusCode;
  String? statusMessage;
  bool? success;
}
