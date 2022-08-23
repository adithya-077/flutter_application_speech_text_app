import 'package:flutter/material.dart';
import 'package:flutter_application_b/models/speech_tile_list.dart';
import 'package:flutter_application_b/models/speech_tile_model.dart';
import 'package:flutter_application_b/utility/shared_pref.dart';
import 'package:provider/provider.dart';

import '../utility/list_container.dart';

class AddspeechTile extends StatefulWidget {
  static const routeName = '/add-speechtile-screen';
  const AddspeechTile({Key? key}) : super(key: key);

  @override
  State<AddspeechTile> createState() => _AddspeechTileState();
}

class _AddspeechTileState extends State<AddspeechTile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TextEditingController titleC = TextEditingController();
    final TextEditingController desC = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: Text('add speech tiles here'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: customInputField(
                        keyfeature: 'title', maxline: 2, textC: titleC),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: screenSize.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: customInputField(
                        keyfeature: 'title', maxline: 5, textC: desC),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: customButton(
                    screenSize: screenSize,
                    text: 'CLICK TO ADD',
                    color: Colors.white,
                    icon: Icons.add_circle_outline,
                    fun: () async {
                      if (titleC.text.isNotEmpty && desC.text.isNotEmpty) {
                        Provider.of<SpeechTileList>(context, listen: false)
                            .addTile(titleC.text, desC.text);
                        await OnDeviceListStore.setSpeechTile(
                            userList: Provider.of<SpeechTileList>(context,
                                    listen: false)
                                .getSTList);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
