import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/colors.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/view_models/home_screen_view_models/search_tab_view_model.dart';
import 'package:provider/provider.dart';
import '../../../models/movie_model.dart';
import '../../../widgets/search_tab_widgets/search_item.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  SearchTabViewModel viewModel = SearchTabViewModel();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35.w),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: onNavSelected,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: fontSmall.copyWith(
                          fontSize: 14.sp, color: Colors.grey),
                      filled: true,
                      fillColor: lightGrey,
                      prefixIcon: const Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                          borderSide: BorderSide(color: onNavSelected)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.sp))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder(
                future: viewModel.getSearchResults(search),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  List<Results> searchResults = snapshot.data!.results ?? [];

                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SearchItem(results: searchResults[index]);
                      },
                      itemCount: searchResults.length,
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
