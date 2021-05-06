import 'package:flutter/material.dart';

class Countdown with ChangeNotifier {
  static int _time = 6;
  var _currentTime = _time;
  var _excercise = 2;
  var _index = 0;

  int get getTime {
    return _currentTime;
  }

  int get getIndex {
    return _index;
  }

  void setLengthExercise(int numOfEx) {
    reset();
    _excercise = numOfEx;
    notifyListeners();
    print("Exercise = $_excercise");
  }

  void countdownTime() async {
    while (_index < _excercise) {
      await Future.delayed(Duration(seconds: 1), () {
        _currentTime--;
        notifyListeners();
      });

      if (_currentTime == 0) {
        if (_index < _excercise - 1) {
          _index++;
        } else {
          _currentTime = 0;
          break;
        }
        _currentTime = _time;
      }
    }
  }

  void resetTime() {
    _index++;
    _currentTime = _time;
  }

  void reset() {
    _index = 0;
    _currentTime = _time;
    notifyListeners();
  }
}
