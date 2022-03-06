import 'package:flutter/material.dart';
import 'package:one_screen_packages/Model/JokeModel.dart';
import 'package:one_screen_packages/View/Widgets/LoadingWidget.dart';
import 'package:one_screen_packages/View/Widgets/SetupOrPunchlineText.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';

class ActionsView extends StatelessWidget {
  const ActionsView({Key? key}) : super(key: key);
  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JokeProvider>(
        create: (_) => JokeProvider(),
        builder: (buildContext, widget) {
          return Consumer<JokeProvider>(
            builder: (context, jokeProvider, child) {
              String currentState = buildContext.read<JokeProvider>().getCurrentState;
              final Map<String, Widget> _appState = {
                'Loading': loadingWidget(),
                'LoadSetup': setupWidget(jokeProvider),
                'LoadPunchline': punchlineWidget(jokeProvider)
              };
              return _appState[currentState] ?? Container();
            },
          );
        });
  }

  //--------------------------------------------------------------------------
  Widget setupWidget(JokeProvider jokeProvider) {
    JokeModel jokeModel = jokeProvider.getJokeModel;
    String setupText = (jokeModel.setup ?? "") +" ((Tappable)) ";
    return setupOrPunchlineText(setupText, () {
      jokeProvider.loadPunchline();
    });
  }


  //--------------------------------------------------------------------------

  Widget punchlineWidget(JokeProvider jokeProvider) {
    JokeModel jokeModel = jokeProvider.getJokeModel;
    String setupText = jokeModel.setup ?? "";
    String punchlineText = jokeModel.punchline ?? "";
    return Column(
      children: [
        setupOrPunchlineText(setupText, () {}),
        const SizedBox(height: 50,),
        setupOrPunchlineText(punchlineText, () {})
      ],
    );
  }
//--------------------------------------------------------------------------

}
