import 'package:flutter/cupertino.dart';

import 'package:flutter_application_b/models/speech_tile_model.dart';
import 'package:flutter_application_b/utility/shared_pref.dart';

class SpeechTileList with ChangeNotifier {
  List<SpeechTileModel> _speechtileList = [];

  void addTile(String tileTitle, String tileDes) {
    final newTile = SpeechTileModel(desription: tileDes, title: tileTitle);
    _speechtileList.add(newTile);
    notifyListeners();
  }

  List<SpeechTileModel> get getSTList {
    return [..._speechtileList];
  }

  void deleteTile(String tileTitle, String tileDes) {
    _speechtileList.removeWhere(
      (element) => element.title == tileTitle && element.desription == tileDes,
    );
    notifyListeners();
  }

  void updateTile() async {
    List<SpeechTileModel> updatedList = await OnDeviceListStore.getSpeechTile();
    _speechtileList = updatedList;
    notifyListeners();
  }
}
