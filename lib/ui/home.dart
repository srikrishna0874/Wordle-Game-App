import 'package:flutter/material.dart';
import 'package:wordlegame/ui/keyboardWidget.dart';
import 'package:wordlegame/util/wordleLogic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WordleLogic game=WordleLogic();


  @override
  Widget build(BuildContext context) {

    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Wordle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth*0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight*0.03,
            ),
            KeyBoardWidget(game),
          ],
        ),
      ),
    );
  }
}
