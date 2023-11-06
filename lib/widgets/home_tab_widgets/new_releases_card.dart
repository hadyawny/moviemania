import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/fonts.dart';

class NewReleasesCard extends StatelessWidget {
  const NewReleasesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.w,
      height: 184.h ,
      color: Color(0xff343534),
      margin: EdgeInsets.symmetric(horizontal: 13.w),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/new_releases_poster.png",width: 97.w,
                  height: 128.h,fit: BoxFit.fill,),
              Image.asset("assets/images/bookmark.png"),
            ],
          ),
          SizedBox(height: 7.h ,),
          Row(
            children: [
              SizedBox(width: 5.w,),
              Icon(Icons.star,color: Colors.yellow,size: 15,),
              SizedBox(width: 5.w,),
              Text("7.7",style: fontExtraSmall.copyWith(color: Colors.white),)
            ],
          ),
          SizedBox(height: 2.h ,),
          Row(
            children: [
              SizedBox(width: 6.w,),
              Text("Narcos",style: fontExtraSmall.copyWith(color: Colors.white),)
            ],
          ),
          SizedBox(height: 2.h ,),
          Row(
            children: [
              SizedBox(width: 6.w,),
              Text("2018",style: fontExtraSmall.copyWith(fontSize: 8.sp),)
            ],
          ),
        ],
      ),
    );
  }
}
