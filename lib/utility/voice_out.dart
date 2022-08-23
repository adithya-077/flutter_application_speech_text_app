import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts tts = FlutterTts();
voiceOut(String text) async {
  await tts.setVolume(1.0);
  await tts.setSpeechRate(0.4);
  await tts.setLanguage('en-US');
  await tts.setPitch(0.7);
  await tts.speak(text);
}
