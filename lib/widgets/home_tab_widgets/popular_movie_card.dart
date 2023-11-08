import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/routes/routes.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:movies_app/utils/fonts.dart';

class PopularMovieCard extends StatefulWidget {
  final Results results;

  const PopularMovieCard({super.key, required this.results});

  @override
  State<PopularMovieCard> createState() => _PopularMovieCardState();
}

class _PopularMovieCardState extends State<PopularMovieCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 412.w,
      height: 289.h,
      child: Stack(
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    Constants.imgPath + widget.results.backdropPath.toString(),
                width: 412.w,
                height: 180.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 164.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.results.title.toString().length > 33
                            ? widget.results.title.toString().substring(0, 33)
                            : widget.results.title.toString(),
                        style: fontSmall,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.results.releaseDate.toString().length > 4
                                ? widget.results.releaseDate
                                    .toString()
                                    .substring(0, 4)
                                : widget.results.releaseDate.toString(),
                            style: fontExtraSmall,
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
                                    ? widget.results.voteAverage
                                        .toString()
                                        .substring(0, 3)
                                    : widget.results.voteAverage.toString(),
                                style: fontExtraSmall.copyWith(
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      )
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.movieDetails,
                            arguments: widget.results.id.toString());
                      },
                      child: CachedNetworkImage(
                        imageUrl: Constants.imgPath +
                            widget.results.posterPath.toString(),
                        width: 129.w,
                        height: 199.h,
                        fit: BoxFit.fill,
                      ),
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
                )),
          ),
        ],
      ),
    );
  }
}
