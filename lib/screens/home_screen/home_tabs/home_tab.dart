import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/viewmodels/home_screen_view_model/home_tab_view_model.dart';
import 'package:movies_app/widgets/home_tab_widgets/movie_card.dart';
import 'package:provider/provider.dart';

import '../../../widgets/home_tab_widgets/popular_movie_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: viewModel.getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                List<Results> popular = snapshot.data!.results ?? [];

                return CarouselSlider.builder(
                    itemCount: popular.length,
                    itemBuilder: (context, index, realIndex) {
                      return PopularMovieCard(
                        results: popular[index],
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlay: true,
                    ));
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Text(
                      "New Releases ",
                      style: fontSmall.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  FutureBuilder(
                    future: viewModel.getNewReleases(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      List<Results> newReleases = snapshot.data!.results ?? [];

                      return Expanded(
                        child: ListView.builder(
                          itemCount: newReleases.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              results: newReleases[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Text(
                      "Top Rated",
                      style: fontSmall.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  FutureBuilder(
                    future: viewModel.getTopRated(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      List<Results> topRated = snapshot.data!.results ?? [];

                      return Expanded(
                        child: ListView.builder(
                          itemCount: topRated.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              results: topRated[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
