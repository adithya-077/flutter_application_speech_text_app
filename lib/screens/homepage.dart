import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_b/models/speech_tile_list.dart';
import 'package:flutter_application_b/screens/menu_screen.dart';
import 'package:flutter_application_b/screens/speech_tiles.dart';
import 'package:flutter_application_b/screens/text_to_speech.dart';
import 'package:flutter_application_b/utility/colors.dart';
import 'package:flutter_application_b/utility/list_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List tileList = [
      retCustlisttile(
        screenSize: screenSize,
        name: 'text to speech',
        iconData: Icons.record_voice_over,
        context: context,
        routname: TextToSpeechScreen.routeName,
      ),
      retCustlisttile(
        screenSize: screenSize,
        name: 'speach tile',
        iconData: Icons.window_sharp,
        context: context,
        routname: SpeechTile.routeName,
      ),
      retCustlisttile(
        screenSize: screenSize,
        name: 'sign lang to speech',
        iconData: Icons.sign_language,
        context: context,
        routname: TextToSpeechScreen.routeName,
      ),
      retCustlisttile(
        screenSize: screenSize,
        name: 'community pool',
        iconData: Icons.groups,
        context: context,
        routname: TextToSpeechScreen.routeName,
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenSize.height * 0.5,
                    //child: Image.network(
                    //  'https://media.istockphoto.com/vectors/origami-bird-design-vector-id1128396650?k=20&m=1128396650&s=612x612&w=0&h=3c6fDEHDA5boA35KUy2aIiSrCufixJbv_V8Q8bRYQy4='),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: screenSize.height * 0.4,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: tileList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                child: tileList[index],
                                onDoubleTap: () {
                                  Provider.of<SpeechTileList>(context,
                                          listen: false)
                                      .updateTile();
                                },
                              ),
                              custDivider(screenSize, index)
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.menu,
          color: homeText,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(MenuScreen.routName);
        },
      ),
    );
  }
}
