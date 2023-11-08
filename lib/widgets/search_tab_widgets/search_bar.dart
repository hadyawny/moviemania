import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/fonts.dart';

import '../../utils/colors.dart';

class Searchbar extends StatefulWidget {

   String search;


   Searchbar({super.key, required this.search});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.w),
      child: TextField(
        onChanged: (value) {
          setState(() {
            widget.search = value;
          });
        },
        maxLines: 1,
        style:const TextStyle(color: Colors.white ),
        cursorColor: onNavSelected,

        decoration: InputDecoration(

            hintText: "Search",
            hintStyle: fontSmall.copyWith(fontSize: 14.sp,color: Colors.grey),
            filled: true,
            fillColor: lightGrey,
            prefixIcon: const Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.sp),
                borderSide: BorderSide(
                    color: onNavSelected
                )
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.sp)
            )

        ),
      ),
    );
  }
}
