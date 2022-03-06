import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_screen_packages/Api/JokeApi.dart';
import 'package:one_screen_packages/Model/JokeModel.dart';

class JokeProvider with ChangeNotifier {
  final Map<int, String> appState = {
    0: 'Loading',
    1: 'LoadSetup',
    2: 'LoadPunchline',
  };
  String currentState = 'Loading';
  JokeApi jokeApi= JokeApi();
  JokeModel? jokeModel;

  //----------------------------------------------------------------------------
  JokeProvider() {
    // setCurrentState(0);
    loading();
  }

  //----------------------------------------------------------------------------
  void setCurrentState(int state) => currentState = appState[state]!;

  String get getCurrentState => currentState;

  //----------------------------------------------------------------------------
  JokeModel? get getJokeModel => jokeModel;

  //----------------------------------------------------------------------------

  Future<void> loading() async {
    setCurrentState(0);
    notifyListeners();
    await loadSetup();
  }

  //----------------------------------------------------------------------------

  Future<void> loadSetup() async {
    jokeModel = await jokeApi.fetchJoke();
    setCurrentState(1);
    notifyListeners();
  }

  //----------------------------------------------------------------------------

  void loadPunchline() {
    setCurrentState(2);
    notifyListeners();
    restart();
  }

//----------------------------------------------------------------------------
  void restart() {
    Future.delayed(const Duration(seconds: 5), () async {
      await loading();
    });
  }
//----------------------------------------------------------------------------
}
