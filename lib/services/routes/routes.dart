import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/screens/home_screen/home_screen.dart';
import 'package:movies_app/screens/movie_details.dart';
import 'package:movies_app/screens/searched_movie_details.dart';

class AppRoute {
  static const String home = "/";
  static const String movieDetails = "Movie Details";
  static const String searchedMovieDetails = "Searched Movie Details";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case AppRoute.movieDetails:

        final args = settings.arguments as Results ;

        return MaterialPageRoute(
          builder: (context) =>  MovieDetails(args),
        );
      case AppRoute.searchedMovieDetails:

        final args = settings.arguments as SearchResults ;

        return MaterialPageRoute(
          builder: (context) =>  SearchedMovieDetails(args),
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
