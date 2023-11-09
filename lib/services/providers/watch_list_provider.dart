import 'package:flutter/material.dart';

class WatchListProvider extends ChangeNotifier{

  List<int> watchListIds = [];


  addWatchListId(int id){

    watchListIds.add(id);
    notifyListeners();

  }
  removeWatchListId(int id){

    watchListIds.remove(id);
    notifyListeners();

  }


}