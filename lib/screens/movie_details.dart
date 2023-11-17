import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/credits_model.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/view_models/movie_details_view_model.dart';
import 'package:movies_app/widgets/home_tab_widgets/movie_card.dart';
import 'package:movies_app/widgets/movie_details_widgets/movie_details_card.dart';
import 'package:provider/provider.dart';

import '../services/providers/watch_list_provider.dart';
import '../widgets/movie_details_widgets/cast_card.dart';

class MovieDetails extends StatefulWidget {
  final Results args;

  const MovieDetails(this.args, {super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WatchListProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                provider.updateProvider();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            widget.args.title.toString(),
            style: fontSmall.copyWith(fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 520.h,
                child: FutureBuilder(
                  future: viewModel.getMovieDetails(widget.args.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Please Check Your Internet',
                          style: fontSmall,
                        ),
                      );
                    }
                    MovieDetailsModel movieDetailsModel = snapshot.data!;

                    return MovieDetailsCard(
                      results: widget.args,
                      movieDetailsModel: movieDetailsModel,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 230.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "Top Billed Cast",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder(
                      future:
                          viewModel.getCastDetails(widget.args.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                'Please Check Your Internet',
                                style: fontSmall,
                              ),
                            ),
                          );
                        }

                        List<Cast> cast = snapshot.data!.cast ?? [];

                        return Expanded(
                          child: ListView.builder(
                            itemCount: cast.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CastCard(
                                cast: cast[index],
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
                height: 20.h,
              ),
              Container(
                height: 230.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "More Like This",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder(
                      future:
                          viewModel.getSemilarMovies(widget.args.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                'Please Check Your Internet',
                                style: fontSmall,
                              ),
                            ),
                          );
                        }

                        List<Results> similar = snapshot.data!.results ?? [];

                        return Expanded(
                          child: ListView.builder(
                            itemCount: similar.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              for (int i = 0;
                                  i < provider.watchListIds.length;
                                  i++) {
                                if (provider.watchListIds[i] ==
                                    similar[index].id) {
                                  similar[index].favourite = true;
                                }
                              }
                              return MovieCard(
                                results: similar[index],
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
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
