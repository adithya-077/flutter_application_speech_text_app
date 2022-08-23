import 'package:flutter/material.dart';
import 'package:flutter_application_b/utility/voice_out.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_b/models/speech_tile_list.dart';
import 'package:flutter_application_b/models/speech_tile_model.dart';
import 'package:flutter_application_b/utility/list_container.dart';
import 'package:flutter_application_b/screens/add_speechtile_screen.dart';

class SpeechTile extends StatefulWidget {
  static const String routeName = '/speech-tile-Screen';
  const SpeechTile({Key? key}) : super(key: key);

  @override
  State<SpeechTile> createState() => _SpeechTileState();
}

class _SpeechTileState extends State<SpeechTile> {
  @override
  Widget build(BuildContext context) {
    void navToAdd() {
      Navigator.of(context).pushNamed(AddspeechTile.routeName);
    }

    List<SpeechTileModel> girdList =
        Provider.of<SpeechTileList>(context, listen: false).getSTList;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: screenSize.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('SPEECH TILE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('available speech tiles'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: screenSize.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: screenSize.height * 0.55,
                          child: girdList.isNotEmpty
                              ? GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: girdList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (() {
                                        voiceOut(girdList[index].desription);
                                      }),
                                      child: customSpeechTile(
                                          context: context,
                                          screenSize: screenSize,
                                          text: girdList[index].title,
                                          des: girdList[index].desription),
                                    );
                                  },
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('NO TILE ADDED',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text('ADD NEW TILE',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customButton(
                  screenSize: screenSize,
                  text: 'CLICK TO ADD',
                  color: Colors.white,
                  icon: Icons.add_circle_outline,
                  fun: navToAdd),
            )
          ]),
        ),
      ),
    );
  }
}
