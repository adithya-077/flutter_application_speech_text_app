import 'package:flutter/material.dart';
import 'package:flutter_application_b/models/speech_tile_list.dart';

import 'package:flutter_application_b/routes/route_generater.dart';
import 'package:flutter_application_b/utility/shared_pref.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OnDeviceListStore.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SpeechTileList()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => routeGenerater(settings),
      ),
    );
  }
}
