import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/services/routes/routes.dart';

import '../../models/search_model.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class SearchItem extends StatelessWidget {

  SearchResults searchResults;

   SearchItem({super.key,required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.searchedMovieDetails,arguments: searchResults);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h,horizontal:30.w ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
              Constants.imgPath + searchResults.posterPath.toString(),
              width: 100.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(searchResults.title.toString(),style: fontSmall.copyWith(fontSize: 15),maxLines: 1,),
                  SizedBox(height: 5.h,),
                  Text(
                    searchResults.releaseDate.toString().length > 4
                        ? searchResults.releaseDate
                        .toString()
                        .substring(0, 4)
                        : searchResults.releaseDate.toString(),
                    style: fontExtraSmall.copyWith(fontSize: 13),maxLines: 1,
                  ),
                  SizedBox(height: 5.h,),
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
                      Text(searchResults.voteAverage.toString().length>3?
                      searchResults.voteAverage.toString().substring(0, 3):searchResults.voteAverage.toString(),
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
