import 'dart:convert';

class SpeechTileModel {
  String title;
  String desription;

  SpeechTileModel({required this.desription, required this.title});

  factory SpeechTileModel.fromJson(Map<String, dynamic> jsonData) {
    return SpeechTileModel(
      title: jsonData['title'],
      desription: jsonData['desription'],
    );
  }

  static Map<String, dynamic> toMap(SpeechTileModel music) => {
        'title': music.title,
        'desription': music.desription,
      };

  static String encode(List<SpeechTileModel> stm) => json.encode(
        stm
            .map<Map<String, dynamic>>((itm) => SpeechTileModel.toMap(itm))
            .toList(),
      );

  static List<SpeechTileModel> decode(String stm) =>
      (json.decode(stm) as List<dynamic>)
          .map<SpeechTileModel>((item) => SpeechTileModel.fromJson(item))
          .toList();
}
