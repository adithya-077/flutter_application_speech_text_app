import 'package:flutter/material.dart';

import '../utility/list_container.dart';

class MenuScreen extends StatefulWidget {
  static const routName = '/menu-page';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List tileList = [
      custlisttile(
        screenSize: screenSize,
        name: 'Police Assistance',
        colors: Colors.red,
        context: context,
        routname: '',
      ),
      custlisttile(
        screenSize: screenSize,
        name: 'Medical Assistance',
        colors: Colors.green,
        context: context,
        routname: '',
      ),
      custlisttile(
        screenSize: screenSize,
        name: 'Emergency Contact',
        colors: Colors.yellow,
        context: context,
        routname: '',
      ),
      custlisttile(
        screenSize: screenSize,
        name: 'Cancel',
        colors: Colors.deepPurple,
        context: context,
        routname: '',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text(
            'SOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tileList.length,
              itemBuilder: (context, index) {
                return tileList[index];
              },
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.purple,
        child: const Icon(Icons.menu),
        backgroundColor: Colors.white,
        highlightElevation: 10,
        elevation: 10,
        onPressed: () {},
      ),
    );
  }
}
