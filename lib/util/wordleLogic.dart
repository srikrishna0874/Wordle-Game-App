import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:wordlegame/util/individualCharacter.dart';

class WordleLogic {
  int rowNumber = 0;
  int letterAscii = 0;
  static String message = "";
  static String correctWord = "";
  static List<String> wordList = [];
  static List<List<String>> allWords = List.generate(26, (index) => []);
  static bool gameStatus = false;
  static List<Letter> gameRow = List.generate(5, (index) => Letter("", 0));
  static List<List<Letter>> gameBoard =
      List.generate(5, (index1) => List.generate(5, (index2) => Letter("", 0)));

  static Future<void> getWords() async {
    String apiUrl = "https://api.datamuse.com/words?sp=";
    int res = 0;
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
      wordList.addAll(allWords[i]);
    }
    print(wordList);
  }

  static Future<void> initGame() async {
    //var response=await http.get(Uri.parse(apiUrl));
    //print(response.statusCode);
    //print(response.body);
  }

  void add(ind, word) {
    gameBoard[rowNumber][ind] = word;
  }

  bool check(String word) {
    return wordList.contains(word);
  }
}
