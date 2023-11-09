import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view_models/home_screen_view_models/watch_list_tab_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/fonts.dart';
import '../../../widgets/watch_list_tab_widgets/watch_list_item.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  WatchListTabViewModel viewModel = WatchListTabViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
              child: Text(
                "Watch List",
                style: fontSmall.copyWith(
                    fontSize: 25.sp, fontWeight: FontWeight.w500),
              ),
            ),
            StreamBuilder<QuerySnapshot<Results>>(
              stream: viewModel.getMovie(),
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

                var watchList =
                    snapshot.data!.docs.map((doc) => doc.data()).toList();

                return Expanded(
                  child: ListView.builder(
                    itemCount: watchList.length,
                    itemBuilder: (context, index) {
                      return WatchListItem(
                        results: watchList[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
