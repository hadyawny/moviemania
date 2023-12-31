import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:provider/provider.dart';
import '../../services/firebase/firebase_manager.dart';
import '../../services/providers/watch_list_provider.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class MovieDetailsCard extends StatefulWidget {
  final MovieDetailsModel movieDetailsModel;
  final Results results;

  const MovieDetailsCard(
      {super.key, required this.movieDetailsModel, required this.results});

  @override
  State<MovieDetailsCard> createState() => _MovieDetailsCardState();
}

class _MovieDetailsCardState extends State<MovieDetailsCard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WatchListProvider>(context);
    return SizedBox(
      height: 440.h,
      width: 412.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: Constants.imgPath +
                widget.movieDetailsModel.backdropPath.toString(),
            width: 412.w,
            height: 217.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 13.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieDetailsModel.title.toString(),
                    maxLines: 1,
                    style: fontSmall.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    widget.movieDetailsModel.releaseDate
                        .toString()
                        .substring(0, 4),
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
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: Constants.imgPath +
                          widget.movieDetailsModel.posterPath.toString(),
                      width: 129.w,
                      height: 199.h,
                      fit: BoxFit.fill,
                    ),
                    !widget.results.favourite
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                widget.results.favourite =
                                    !widget.results.favourite;
                                FirebaseManager.addMovie(widget.results);
                                provider.addWatchListId(widget.results.id!);
                              });
                            },
                            child: Image.asset(
                              "assets/images/bookmark.png",
                              width: 27.w,
                              height: 36.h,
                            ))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                widget.results.favourite =
                                    !widget.results.favourite;
                                FirebaseManager.deleteMovie(widget.results);
                                provider.removeWatchListId(widget.results.id!);
                              });
                            },
                            child: Image.asset(
                              "assets/images/favourite.png",
                              width: 27.w,
                              height: 36.h,
                            )),
                  ],
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
                            widget.movieDetailsModel.overview.toString(),
                            style: fontSmall.copyWith(fontSize: 13.sp),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              widget.movieDetailsModel.voteAverage
                                  .toString()
                                  .substring(0, 3),
                              style: fontSmall.copyWith(
                                  color: Colors.white, fontSize: 18.sp),
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
