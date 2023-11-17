import 'package:movies_app/models/movie_model.dart';

class CombinedCreditsModel {
  CombinedCreditsModel({
      this.results,
      this.crew, 
      this.id,});

  CombinedCreditsModel.fromJson(dynamic json) {
    if (json['cast'] != null) {
      results = [];
      json['cast'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
    id = json['id'];
  }
  List<Results>? results;
  List<Crew>? crew;
  int? id;



}

class Crew {
  Crew({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount, 
      this.creditId, 
      this.department, 
      this.job, 
      this.mediaType,});

  Crew.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
    mediaType = json['media_type'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? creditId;
  String? department;
  String? job;
  String? mediaType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['credit_id'] = creditId;
    map['department'] = department;
    map['job'] = job;
    map['media_type'] = mediaType;
    return map;
  }

}

