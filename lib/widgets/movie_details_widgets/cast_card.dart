import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/services/routes/routes.dart';

import 'package:movies_app/utils/constants.dart';
import 'package:movies_app/utils/fonts.dart';

import '../../models/credits_model.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.actorDetails, arguments: cast);
      },
      child: Container(
        width: 110.w,
        height: 200.h,
        color: const Color(0xff343534),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: Constants.imgPath + cast.profilePath.toString(),
              width: 110.w,
              height: 160.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          cast.name.toString().length > 15
                              ? cast.name.toString().substring(0, 15)
                              : cast.name.toString(),
                          style: fontExtraSmall.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
