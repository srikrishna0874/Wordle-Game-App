import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordlegame/util/wordleLogic.dart';

class WordleScreen extends StatefulWidget {
  WordleLogic game;
  WordleScreen(this.game, {super.key});

  @override
  State<WordleScreen> createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {
  
  Color getColor(int status) {
    if(status==0) {
      return Colors.grey.shade800;
    }
    else if(status==1) {
      return Color.fromRGBO(83, 141, 78, 1);
    }
    else {
      return Color.fromRGBO(181, 159, 59, 1);
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Column(
      children: widget.game.gameBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e.map((e) => Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: getColor(e.status),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(e.character!,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),),
                  ),

                  //color: getColor(e.status),
                )).toList(),
              ))
          .toList(),
    );
  }
}
