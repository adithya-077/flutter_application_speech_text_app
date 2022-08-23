import 'package:flutter/material.dart';

import '../utility/voice_out.dart';

class TextToSpeechScreen extends StatefulWidget {
  static const String routeName = '/Text-To-Speech-Screen';
  const TextToSpeechScreen({Key? key}) : super(key: key);
  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  bool isListern = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final TextEditingController sText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          !isListern && !sText.text.isNotEmpty
              ? Container(
                  color: Colors.black,
                  height: screenSize.height,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 15),
                          child: Text(
                            'TEXT TO SPEECH',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, left: 15),
                            child: Text(
                              'TYPE TO SPEAK OUT LOUD.',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : textCustom(screenSize, 'VOICE NOW ENABLED', Colors.blue, 25),
          Container(
            child: Align(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        controller: sText,
                        maxLines: 10,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text('Enter the text here'),
                            labelStyle: TextStyle(
                              fontSize: 25,
                            ))),
                  ),
                  SizedBox.fromSize(
                    size: const Size(56, 56),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              if (sText.text.isNotEmpty) {
                                isListern = !isListern;
                              }
                            });
                            if (isListern && sText.text.isNotEmpty) {
                              voiceOut(sText.text).then((_) {
                                setState(() {
                                  isListern = !isListern;
                                });
                              });
                            }
                          }, // button pressed
                          child: isListern == false && sText.text.isEmpty
                              ? const Icon(Icons.note_alt)
                              : const Icon(Icons.record_voice_over),
                        ),
                      ),
                    ),
                  ),
                ])),
            width: double.infinity,
            height: screenSize.height * 0.5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
        ],
      ),
    );
  }
}

Widget textCustom(Size screenSize, String text, Color color, double s) {
  return Container(
    color: Colors.black,
    height: screenSize.height,
    width: double.infinity,
    child: Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Text(
              text,
              style: TextStyle(
                  color: color, fontSize: s, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
