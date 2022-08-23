import 'package:flutter/material.dart';
import 'package:flutter_application_b/models/speech_tile_list.dart';
import 'package:flutter_application_b/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

Widget retCustlisttile({
  required Size screenSize,
  required String name,
  required IconData iconData,
  required BuildContext context,
  required String routname,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(routname),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name.toUpperCase(),
                    //softWrap: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.w500,
                      color: homeText,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    iconData,
                    color: homeText,
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}

Container custDivider(Size screenSize, int index) {
  return Container(
    width: screenSize.width * 0.1,
    height: screenSize.height * 0.003,
    color: index.isEven ? homediv_1 : homediv_2,
  );
}

Widget custlisttile({
  required Size screenSize,
  required String name,
  required BuildContext context,
  required String routname,
  required MaterialColor colors,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: () {
        routname.isNotEmpty
            ? Navigator.of(context).pushNamed(routname)
            : Navigator.of(context).pop();
      },
      child: Card(
          color: colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name.toUpperCase(),
                    //softWrap: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}

Widget customSpeechTile(
    {required Size screenSize,
    required String text,
    required String des,
    required BuildContext context}) {
  return Dismissible(
    key: ValueKey(text),
    direction: DismissDirection.startToEnd,
    onDismissed: (direction) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("DELETING TILE $text"),
              content: const Text("ARE YOU SURE YOU WAMT TO DELETE THIS TILE?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: TextButton(
                    child: const Text('YES'),
                    onPressed: () {
                      Provider.of<SpeechTileList>(context, listen: false)
                          .deleteTile(text, des);
                      Provider.of<SpeechTileList>(context, listen: false)
                          .updateTile();

                      Navigator.of(context).pop();
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: TextButton(
                    child: const Text('NO'),
                    onPressed: () {
                      //Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    },
                  ),
                ),
              ],
            );
          });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              des.toUpperCase(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          )
        ]),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0061ff),
            Color(0xFF60efff),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(
              0,
              15,
            ),
          )
        ],
      ),
      height: screenSize.height * 0.01,
    ),
  );
}

Widget customButton(
    {required Size screenSize,
    required String text,
    required Color color,
    required IconData icon,
    required fun}) {
  return ElevatedButton(
    onPressed: () {
      fun();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(
          width: screenSize.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget customInputField(
    {required TextEditingController textC,
    required int maxline,
    required String keyfeature}) {
  return TextFormField(
      controller: textC,
      maxLines: maxline,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          border: InputBorder.none,
          label: Text('Enter the $keyfeature here'),
          labelStyle: const TextStyle(
            fontSize: 25,
          )));
}

Widget customButton2(
    {required Size screenSize,
    required String text,
    required Color color,
    required IconData icon,
    required Function() fun}) {
  return ElevatedButton(
    onPressed: fun,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(
          width: screenSize.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
