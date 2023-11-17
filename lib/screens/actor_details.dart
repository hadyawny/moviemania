import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/actor_details_model.dart';
import 'package:movies_app/models/credits_model.dart';

import 'package:movies_app/utils/fonts.dart';

import 'package:provider/provider.dart';

import '../services/providers/watch_list_provider.dart';
import '../view_models/actor_details_view_model.dart';
import '../widgets/actor_details_widgets/actor_details_card.dart';


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
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
