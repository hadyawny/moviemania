import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/services/routes/routes.dart';

import '../../utils/fonts.dart';

class CategoryCard extends StatelessWidget {
  Genres genres;

  CategoryCard({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.movieGenre, arguments: genres);
      },
      child: Container(
        width: 180.w,
        height: 120.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/categories_img.jpg",
                width: 180.w, height: 120.h, fit: BoxFit.fill),
            Container(
              width: 180.w,
              height: 120.h,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            Text(
              genres.name.toString(),
              style:
                  fontSmall.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
