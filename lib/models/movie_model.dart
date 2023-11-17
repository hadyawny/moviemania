class MovieModel {
  MovieModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  MovieModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    totalResults = json['total_results'];
  }

  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  num? statusCode;
  String? statusMessage;
  bool? success;
}

class Results {
  Results({
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
    this.character,
    this.creditId,
    this.order,
    this.mediaType,
  });

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'].toString();
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
    if (json['favourite'] == null) {
      favourite = false;
    } else {
      favourite = json['favourite'];
    }
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    mediaType = json['media_type'];
  }

  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  String? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  String? character;
  String? creditId;
  int? order;
  String? mediaType;
  bool favourite = false;

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
    map['favourite'] = favourite;
    return map;
  }
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  String? maximum;
  String? minimum;
}
