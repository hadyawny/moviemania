import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/routes/routes.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:movies_app/utils/fonts.dart';

class MovieCard extends StatefulWidget {
  final Results results;

  const MovieCard({super.key, required this.results});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 184.h,
      color: const Color(0xff343534),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.movieDetails,
              arguments: widget.results);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      Constants.imgPath + widget.results.posterPath.toString(),
                  width: 110.w,
                  height: 128.h,
                  fit: BoxFit.fill,
                ),
                !widget.results.favourite
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            widget.results.favourite =
                                !widget.results.favourite;
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
                  size: 15.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  widget.results.voteAverage.toString().length > 3
                      ? widget.results.voteAverage.toString().substring(0, 3)
                      : widget.results.voteAverage.toString(),
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
                  widget.results.title.toString().length > 17
                      ? widget.results.title.toString().substring(0, 17)
                      : widget.results.title.toString(),
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
                  widget.results.releaseDate.toString().length > 4
                      ? widget.results.releaseDate.toString().substring(0, 4)
                      : widget.results.releaseDate.toString(),
                  style: fontExtraSmall.copyWith(fontSize: 8.sp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
