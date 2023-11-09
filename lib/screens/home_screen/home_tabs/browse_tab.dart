import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/view_models/home_screen_view_models/browse_tab_view_model.dart';
import 'package:provider/provider.dart';

import '../../../models/movie_details_model.dart';
import '../../../widgets/browse_tab_widgets/category_card.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  BrowseTabViewModel viewModel = BrowseTabViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Browse Category ",
                  style: fontSmall.copyWith(fontSize: 22),
                ),
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder(
                  future: viewModel.getGenres(),
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

                    List<Genres> genres = snapshot.data!.genres ?? [];

                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 20.w),
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            genres: genres[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
