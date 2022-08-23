import 'package:flutter/material.dart';
import 'package:flutter_application_b/screens/add_speechtile_screen.dart';
import 'package:flutter_application_b/screens/homepage.dart';
import 'package:flutter_application_b/screens/menu_screen.dart';
import 'package:flutter_application_b/screens/speech_tiles.dart';

import 'package:flutter_application_b/screens/text_to_speech.dart';

Route<dynamic> routeGenerater(RouteSettings settings) {
  switch (settings.name) {
    case TextToSpeechScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const TextToSpeechScreen(),
      );
    case MenuScreen.routName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const MenuScreen(),
      );
    case SpeechTile.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SpeechTile(),
      );
    case AddspeechTile.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const AddspeechTile(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(child: Text('PAGE NOT FOUND!!!!')),
          );
        },
      );
  }
}
