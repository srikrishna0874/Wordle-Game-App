import 'package:flutter/material.dart';
import 'package:wordlegame/ui/keyboardWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Wordle",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth*0.1,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight*0.03,
          ),
          KeyBoardWidget(),
        ],
      ),
    );
  }
}
