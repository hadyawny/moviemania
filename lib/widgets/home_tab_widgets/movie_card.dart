import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:movies_app/utils/fonts.dart';

class MovieCard extends StatelessWidget {
  String title;
  String rating;
  String poster;
  String date;

  MovieCard(
      {required this.title,
      required this.date,
      required this.rating,
      required this.poster,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 184.h,
      color: Color(0xff343534),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [

              CachedNetworkImage(imageUrl: Constants.imgPath + poster,width: 110.w,
                height: 128.h,
                fit: BoxFit.fill,
              ),
              Image.asset("assets/images/bookmark.png"),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                rating.substring(0,3),
                style: fontExtraSmall.copyWith(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              Text(
                title.length>17? title.substring(0,17):title,
                style: fontExtraSmall.copyWith(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              Text(
                date.substring(0,4),
                style: fontExtraSmall.copyWith(fontSize: 8.sp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
