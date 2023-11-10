import 'package:flutter/material.dart';
import 'package:movies_app/services/cache/shared_pref.dart';

class WatchListProvider extends ChangeNotifier {
  List<String> watchListIds = [];

  void init() async {
    List<String> newWatchListIds = SharedPrefs.getList();
    watchListIds = newWatchListIds;
  }

  addWatchListId(String id) {
    watchListIds.add(id);
    SharedPrefs.saveList(watchListIds);
  }

  removeWatchListId(String id) {
    watchListIds.remove(id);
    SharedPrefs.saveList(watchListIds);
  }

  updateProvider(){
    notifyListeners();
  }

}
