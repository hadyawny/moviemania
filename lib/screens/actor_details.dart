import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/actor_details_model.dart';
import 'package:movies_app/models/actor_images_model.dart';
import 'package:movies_app/models/credits_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:provider/provider.dart';
import '../services/providers/watch_list_provider.dart';
import '../utils/constants.dart';
import '../view_models/actor_details_view_model.dart';
import '../widgets/actor_details_widgets/actor_details_card.dart';
import '../widgets/home_tab_widgets/movie_card.dart';

class ActorDetails extends StatefulWidget {
  final Cast args;

  const ActorDetails(this.args, {super.key});

  @override
  State<ActorDetails> createState() => _ActorDetailsState();
}

class _ActorDetailsState extends State<ActorDetails> {
  ActorDetailsViewModel viewModel = ActorDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WatchListProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                provider.updateProvider();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            widget.args.name.toString(),
            style: fontSmall.copyWith(fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 310.h,
                child: FutureBuilder(
                  future: viewModel.getActorDetails(widget.args.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Please Check Your Internet',
                          style: fontSmall,
                        ),
                      );
                    }
                    ActorDetailsModel actordetails = snapshot.data!;

                    return ActorDetailsCard(actorDetailsModel: actordetails);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300.h,
                margin: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Pictures",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FutureBuilder(
                      future: viewModel.getActorImages(widget.args.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                'Please Check Your Internet',
                                style: fontSmall,
                              ),
                            ),
                          );
                        }

                        List<Profiles> actorImages = snapshot.data!.profiles ?? [];

                        return Expanded(
                            child:CarouselSlider.builder(
                              itemCount: actorImages.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    Constants.imgPath + actorImages[index].filePath.toString(),
                                    width: 300.w,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlay: true,

                              ),
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              Container(
                height: 230.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "Known For",
                        style: fontSmall.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder(
                      future: viewModel.getKnownFor(widget.args.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                'Please Check Your Internet',
                                style: fontSmall,
                              ),
                            ),
                          );
                        }

                        List<Results> knownFor = snapshot.data!.results ?? [];

                        return Expanded(
                          child: ListView.builder(
                            itemCount: knownFor.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              for (int i = 0;
                              i < provider.watchListIds.length;
                              i++) {
                                if (provider.watchListIds[i] ==
                                    knownFor[index].id) {
                                  knownFor[index].favourite = true;
                                }
                              }
                              return MovieCard(
                                results: knownFor[index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
