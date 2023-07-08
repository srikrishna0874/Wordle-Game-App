import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:wordlegame/util/individualCharacter.dart';

class WordleLogic {
  int rowNumber = 0;
  int letterId = 0;
  static String message = "";
  static String correctWord = "";
  static List<String> wordList = [];
  static List<List<String>> allWords = List.generate(26, (index) => []);
  static bool gameStatus = false;
  static List<Letter> gameRow = List.generate(5, (index) => Letter("", 0));
  List<List<Letter>> gameBoard =
      List.generate(6, (index1) => List.generate(5, (index2) => Letter("", 0)));

  static Future<void> getWords() async {
    String apiUrl = "https://api.datamuse.com/words?sp=";
    for (int i = 0; i < 26; i++) {
      String str = String.fromCharCode('a'.codeUnitAt(0) + i);
      var response = await http.get(Uri.parse(apiUrl + "$str????"));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<String> temp = data
            .map((e) => e['word'] as String)
            .where((element) =>
                element.length == 5 && element.contains(RegExp(r'^[a-zA-Z]+$')))
            .toList();
        allWords[i] = temp;
        print(".");
        //print(allWords[i]);
      }
    }
    for (int i = 0; i < 26; i++) {
      print(allWords[i]);
      for (int j = 0; j < allWords[i].length; j++) {
        wordList.add(allWords[i][j].toUpperCase());
      }
    }
    print(wordList);
    print(wordList.length);
    initGame();
  }

  static Future<void> initGame() async {
    print("\n\n\n\nRandom function started\n\n\n\n\n\n");
    final rand = new Random();
    int ind = rand.nextInt(wordList.length);
    correctWord = wordList[ind];
    print("\n\n\n\nCorrect Word: ${correctWord}\n\n\n\n\n\n\n\n\n\n\n");
  }

  void add(ind, letter) {
    gameBoard[rowNumber][ind] = letter;
  }

  bool check(String word) {
    return wordList.contains(word);
  }
}
