import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvide extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuection = 10;
  final String difficultyLevel;

  List? quections;
  int _currentQuection = 0;
  int _correctAwnsers = 0;

  BuildContext context;
  GamePageProvide({required this.context , required this.difficultyLevel}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuectionFromAPI();
  }

  Future<void> _getQuectionFromAPI() async {
    var _response = await _dio.get('', queryParameters: {
      'amount': 10,
      'type': 'boolean',
      'difficulty': difficultyLevel,
    });
    var _data = jsonDecode(_response.toString());
    // print(_data);
    quections = _data["results"];
    notifyListeners();
  }

  String getCurrentQuectionText() {
    return quections![_currentQuection]["question"];
  }

  void awnserQuection(String _awnser) async {
    bool isCorrect = quections![_currentQuection]['correct_answer'] == _awnser;
    isCorrect ? _correctAwnsers++ : _correctAwnsers;
    _currentQuection++;
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
              size: 40,
            ),
          );
        });

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    if (_currentQuection == _maxQuection) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: const Text(
              "End Game!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            content: Text("Score: ${_correctAwnsers.toString()}/10"),
          );
        });
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
    _currentQuection = 0;
  }
}
