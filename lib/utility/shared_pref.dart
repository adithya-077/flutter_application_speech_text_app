import 'package:flutter_application_b/models/speech_tile_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnDeviceListStore {
  static SharedPreferences? _preferences;

  static const _stListKey = 'speechTile';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setSpeechTile({required List<SpeechTileModel> userList}) async {
    final String encodedData = SpeechTileModel.encode(userList);
    await _preferences!.setString(_stListKey, encodedData);
  }

  static Future getSpeechTile() async {
    if (_preferences!.getString(_stListKey) != null) {
      final String? listString = _preferences!.getString(_stListKey);
      final List<SpeechTileModel> originallist =
          SpeechTileModel.decode(listString!);
      return originallist;
    } else {
      return [SpeechTileModel(desription: 'desription', title: 'example')];
    }
  }
}
