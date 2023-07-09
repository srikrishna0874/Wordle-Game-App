

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
  List<Letter> firstRow = [
    Letter("Q", 0),
    Letter("W", 0),
    Letter("E", 0),
    Letter("R", 0),
    Letter("T", 0),
    Letter("Y", 0),
    Letter("U", 0),
    Letter("I", 0),
    Letter("O", 0),
    Letter("P", 0)
  ];
  List<Letter> secondRow = [
    Letter("A", 0),
    Letter("S", 0),
    Letter("D", 0),
    Letter("F", 0),
    Letter("G", 0),
    Letter("G", 0),
    Letter("H", 0),
    Letter("J", 0),
    Letter("K", 0),
    Letter("L", 0)
  ];
  List<Letter> thirdRow = [
    Letter("ENTER", 0),
    Letter("Z", 0),
    Letter("X", 0),
    Letter("C", 0),
    Letter("V", 0),
    Letter("B", 0),
    Letter("N", 0),
    Letter("M", 0),
    Letter("DEL", 0)
  ];

  Color getColor(int status) {
    if (status == 0) {
      return Colors.grey.shade800;
    } else if (status == 1) {
      return Color.fromRGBO(83, 141, 78, 1);
    } else {
      return Color.fromRGBO(181, 159, 59, 1);
    }
  }

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
                debugPrint(e.character);
                if (widget.game.letterId < 6) {
                  setState(() {
                    widget.game
                        .add(widget.game.letterId, Letter(e.character, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: getColor(e.status),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    e.character,
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
                debugPrint(e.character);
                if (widget.game.letterId < 6) {
                  setState(() {
                    widget.game
                        .add(widget.game.letterId, Letter(e.character, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: getColor(e.status),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    e.character,
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
                debugPrint(e.character);
                if (e.character == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game.add(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e.character == "ENTER") {
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
                                List<List<Letter>> allLists = [
                                  firstRow,
                                  secondRow,
                                  thirdRow
                                ];
                                for (var row in allLists) {
                                  bool isPresent = row.any(
                                      (element) => element.character == ch);
                                  if (isPresent) {
                                    Letter letterObj = row.firstWhere(
                                        (element) => element.character == ch);
                                    letterObj.status = 1;
                                    break;
                                  }
                                }
                              });
                            } else {
                              setState(() {
                                widget.game.gameBoard[widget.game.rowNumber][i]
                                    .status = 2;
                                List<List<Letter>> allLists = [
                                  firstRow,
                                  secondRow,
                                  thirdRow
                                ];
                                for (var row in allLists) {
                                  bool isPresent = row.any(
                                          (element) => element.character == ch);
                                  if (isPresent) {
                                    Letter letterObj = row.firstWhere(
                                            (element) => element.character == ch);
                                    letterObj.status = 2;
                                    break;
                                  }
                                }
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
                      widget.game
                          .add(widget.game.letterId, Letter(e.character, 0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: getColor(e.status),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: e.character != "DEL"
                      ? Text(
                          e.character,
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
