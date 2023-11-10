import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/routes/routes.dart';
import 'package:provider/provider.dart';
import '../../services/firebase/firebase_manager.dart';
import '../../services/providers/watch_list_provider.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class WatchListItem extends StatefulWidget {
  final Results results;

  const WatchListItem({super.key, required this.results});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WatchListProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.movieDetails,
            arguments: widget.results);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      Constants.imgPath + widget.results.posterPath.toString(),
                  width: 100.w,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
                !widget.results.favourite
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            widget.results.favourite =
                                !widget.results.favourite;
                            FirebaseManager.addMovie(widget.results);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.results.title.toString(),
                    style: fontSmall.copyWith(fontSize: 15.sp),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    widget.results.releaseDate.toString().length > 4
                        ? widget.results.releaseDate.toString().substring(0, 4)
                        : widget.results.releaseDate.toString(),
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
                        size: 15.r,
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
