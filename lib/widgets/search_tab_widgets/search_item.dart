import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/routes/routes.dart';

import '../../models/search_model.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class SearchItem extends StatelessWidget {
  Results results;

  SearchItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.movieDetails, arguments: results);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: Constants.imgPath + results.posterPath.toString(),
              width: 100.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.title.toString(),
                    style: fontSmall.copyWith(fontSize: 15),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    results.releaseDate.toString().length > 4
                        ? results.releaseDate.toString().substring(0, 4)
                        : results.releaseDate.toString(),
                    style: fontExtraSmall.copyWith(fontSize: 13),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        results.voteAverage.toString().length > 3
                            ? results.voteAverage.toString().substring(0, 3)
                            : results.voteAverage.toString(),
                        style: fontSmall,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
