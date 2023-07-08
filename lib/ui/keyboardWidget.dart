import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordlegame/ui/wordleScreen.dart';
import 'package:wordlegame/util/wordleLogic.dart';

class KeyBoardWidget extends StatefulWidget {
  WordleLogic game;
  KeyBoardWidget(this.game,{super.key});

  @override
  State<KeyBoardWidget> createState() => _KeyBoardWidgetState();
}

class _KeyBoardWidgetState extends State<KeyBoardWidget> {
  List<String> firstRow = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"];
  List<String> secondRow = ["A", "S", "D", "F", "G", "G", "H", "J", "K", "L"];
  List<String> thirdRow = ["ENTER", "Z", "X", "C", "V", "B", "N", "M", "DEL"];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        WordleScreen(widget.game),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: firstRow.map((e) {
            return GestureDetector(
              onTap: () {
                debugPrint(e);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 131, 132, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: secondRow.map((e) {
            return GestureDetector(
              onTap: () {
                debugPrint(e);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 131, 132, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: thirdRow.map((e) {
            return GestureDetector(
              onTap: () {
                debugPrint(e);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 131, 132, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
