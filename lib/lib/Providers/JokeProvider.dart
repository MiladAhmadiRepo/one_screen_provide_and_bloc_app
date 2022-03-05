import 'dart:async';

import 'package:flutter/material.dart';
import '../Model/JokeModel.dart';
import '../api/JokeApi.dart';

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
    print("loading before notifyListeners");
    notifyListeners();
    print("loading before loadSetup");

    await loadSetup();
  }

  //----------------------------------------------------------------------------

  Future<void> loadSetup() async {

    jokeModel = await jokeApi.fetchJoke();
    setCurrentState(1);
    print("loadSetup after fetchJoke");
    notifyListeners();
    print("loadSetup after notifyListeners");


  }

  //----------------------------------------------------------------------------

  void loadPunchline() {
    print("loadPunchline before notifyListeners");

    setCurrentState(2);

    print("loadPunchline after notifyListeners");
    notifyListeners();
    restart();
  }

//----------------------------------------------------------------------------
  void restart() {
    print("restart before restart");
    // Timer(Duration(seconds: 3), ()  {
    //    loading();
    // });
    Future.delayed(const Duration(seconds: 5), () async {
      await loading();

    });
  }
//----------------------------------------------------------------------------
}
