import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/fonts.dart';

class PopularMovieCard extends StatelessWidget {
  const PopularMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412.w,
      height: 289.h,

      child: Stack(
        children: [
          Column(
            children: [
              Image.asset("assets/images/movie_bg.png",fit: BoxFit.cover,),
              SizedBox(height: 14.h,),
              Row(
                children: [
                  SizedBox(width: 164.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dora and the lost city of gold",style: fontSmall,),
                      SizedBox(height: 10.h,),
                      Text("2019",style: fontExtraSmall,),
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 21.w),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Stack(
                  children: [
                    Image.asset("assets/images/movie_poster.png",height: 199.h,width:129.w ,),
                    Image.asset("assets/images/bookmark.png"),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
