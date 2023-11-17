import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/actor_details_model.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class ActorDetailsCard extends StatefulWidget {
  final ActorDetailsModel actorDetailsModel;

  const ActorDetailsCard({super.key, required this.actorDetailsModel});

  @override
  State<ActorDetailsCard> createState() => _ActorDetailsCardState();
}

class _ActorDetailsCardState extends State<ActorDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 412.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 13.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.actorDetailsModel.name.toString(),
                    maxLines: 1,
                    style: fontSmall.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    widget.actorDetailsModel.knownForDepartment.toString(),
                    style: fontExtraSmall.copyWith(fontSize: 14.sp),
                  ),
                ],
              )),
          Container(
            height: 200.h,
            margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: Constants.imgPath +
                      widget.actorDetailsModel.profilePath.toString(),
                  width: 129.w,
                  height: 199.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.actorDetailsModel.biography.toString(),
                            style: fontSmall.copyWith(fontSize: 13.sp),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text(
                              "Born: ",
                              style: fontSmall.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              widget.actorDetailsModel.birthday.toString(),
                              style: fontSmall.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
