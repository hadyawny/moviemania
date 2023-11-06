import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/viewmodels/home_screen_view_model/home_tab_view_model.dart';
import 'package:movies_app/widgets/home_tab_widgets/new_releases_card.dart';
import 'package:provider/provider.dart';

import '../../../widgets/home_tab_widgets/popular_movie_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer(builder: (context, viewModel, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PopularMovieCard(),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13.h),
                      child: Text(
                        "New Releases ",
                        style: fontSmall.copyWith(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const Row(
                      children: [
                        NewReleasesCard(),
                        NewReleasesCard(),
                        NewReleasesCard()
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13.h),
                      child: Text(
                        "Recommended ",
                        style: fontSmall.copyWith(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const Row(
                      children: [
                        NewReleasesCard(),
                        NewReleasesCard(),
                        NewReleasesCard()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },),
    );



  }
}
