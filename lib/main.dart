import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/JokeProvider.dart';
import 'View/ActionsView.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JokeProvider()),
      ],
      child: App(),

    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Timer',
      home: Scaffold(
        appBar: AppBar(title: const Text('Random joke')),
        body:  Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0),
          child: ActionsView(),
        ),
      ),
    );
  }
}
