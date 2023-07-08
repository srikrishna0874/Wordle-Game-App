import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordlegame/ui/wordleScreen.dart';
import 'package:wordlegame/util/individualCharacter.dart';
import 'package:wordlegame/util/wordleLogic.dart';

class KeyBoardWidget extends StatefulWidget {
  WordleLogic game;
  KeyBoardWidget(this.game, {super.key});

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
        Text(
          WordleLogic.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        WordleScreen(widget.game),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: firstRow.map((e) {
            return GestureDetector(
              onTap: () {
                debugPrint(e);
                if (widget.game.letterId < 6) {
                  setState(() {
                    widget.game.add(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                  });
                }
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
                if (widget.game.letterId < 6) {
                  setState(() {
                    widget.game.add(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                  });
                }
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
                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game.add(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "ENTER") {
                  if (widget.game.letterId >= 5) {
                    String userGuess = "";
                    for (int i = 0;
                        i < widget.game.gameBoard[widget.game.rowNumber].length;
                        i++) {
                      userGuess += widget
                          .game.gameBoard[widget.game.rowNumber][i].character;
                    }
                    print("User guessed: $userGuess");
                    if (widget.game.check(userGuess)) {
                      if (userGuess == WordleLogic.correctWord) {
                        setState(() {
                          WordleLogic.message = "Correct";
                          for (int i = 0;
                              i <
                                  widget.game.gameBoard[widget.game.rowNumber]
                                      .length;
                              i++) {
                            widget.game.gameBoard[widget.game.rowNumber][i]
                                .status = 1;
                          }
                        });

                      } else {
                        for (int i = 0; i < userGuess.length; i++) {
                          String ch = userGuess[i];
                          if (WordleLogic.correctWord.contains(ch)) {
                            if (WordleLogic.correctWord[i] == ch) {
                              setState(() {
                                widget.game.gameBoard[widget.game.rowNumber][i]
                                    .status = 1;
                              });
                            } else {
                              setState(() {
                                widget.game.gameBoard[widget.game.rowNumber][i]
                                    .status = 2;
                              });
                            }
                          }
                        }
                        widget.game.rowNumber++;
                        widget.game.letterId = 0;
                      }
                    } else {
                      setState(() {
                        WordleLogic.message = "Word not exists";
                      });
                    }
                  }
                } else {
                  if (widget.game.letterId < 6) {
                    setState(() {
                      widget.game.add(widget.game.letterId, Letter(e, 0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 131, 132, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: e != "DEL"
                      ? Text(
                          e,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Icon(
                          Icons.backspace_outlined,
                          color: Colors.white,
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
