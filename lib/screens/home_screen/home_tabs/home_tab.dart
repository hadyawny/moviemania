import 'package:card_swiper/card_swiper.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/view_models/home_screen_view_models/home_tab_view_model.dart';
import 'package:movies_app/widgets/home_tab_widgets/movie_card.dart';
import 'package:provider/provider.dart';
import '../../../services/providers/watch_list_provider.dart';
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
    var provider = Provider.of<WatchListProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 412.w,
                height: 245.h,
                child: FutureBuilder(
                  future: viewModel.getPopular(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Please Check Your Internet',style: fontSmall,),
                      );
                    }

                    List<Results> popular = snapshot.data!.results ?? [];

                    return Swiper(
  itemCount: popular.length,
  itemBuilder: (context, index) { // The new builder is simpler
    // ... your logic
    for(int i =0;i<provider.watchListIds.length;i++){
      if(provider.watchListIds[i]==popular[index].id){
        popular[index].favourite=true;
      }
    }
    return PopularMovieCard(
      results: popular[index],
    );
  },
  viewportFraction: 1.0,
  scale: 1, // Use scale: 1 instead of enlargeCenterPage: false
  autoplay: true,
  autoplayDelay: 3000, // Note: delay is in milliseconds
);
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 230.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Text(
                        "New Releases ",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
                          return Expanded(
                            child: Center(
                              child: Text('Please Check Your Internet',style: fontSmall,),
                            ),
                          );
                        }

                        List<Results> newReleases = snapshot.data!.results ?? [];

                        return Expanded(
                          child: ListView.builder(
                            itemCount: newReleases.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {

                              for(int i =0;i<provider.watchListIds.length;i++){
                                if(provider.watchListIds[i]==newReleases[index].id){
                                  newReleases[index].favourite=true;
                                }
                              }


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
                height: 230.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Text(
                        "Top Rated",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
                          return Expanded(
                            child: Center(
                              child: Text('Please Check Your Internet',style: fontSmall,),
                            ),
                          );
                        }

                        List<Results> topRated = snapshot.data!.results ?? [];

                        return Expanded(
                          child: ListView.builder(
                            itemCount: topRated.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              for(int i =0;i<provider.watchListIds.length;i++){
                                if(provider.watchListIds[i]==topRated[index].id){
                                  topRated[index].favourite=true;
                                }
                              }
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
      ),
    );
  }
}
