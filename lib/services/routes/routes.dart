import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/home_screen/home_screen.dart';
import 'package:movies_app/screens/movie_details.dart';
import 'package:movies_app/screens/movie_genre.dart';

import '../../models/movie_details_model.dart';

class AppRoute {
  static const String home = "/";
  static const String movieDetails = "Movie Details";
  static const String movieGenre = "Movie Genre";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case AppRoute.movieDetails:
        final args = settings.arguments as Results;

        return MaterialPageRoute(
          builder: (context) => MovieDetails(args),
        );
      case AppRoute.movieGenre:
        final args = settings.arguments as Genres;

        return MaterialPageRoute(
          builder: (context) => MovieGenre(args: args),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: unDefinedRoute(),
          ),
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(
      child: Text("Route Not Found"),
    );
  }
}
