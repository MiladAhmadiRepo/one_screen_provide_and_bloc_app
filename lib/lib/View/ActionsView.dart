import 'package:flutter/material.dart';
import 'package:one_screen_provider_app/View/Widgets/SetupOrPunchlineText.dart';
import 'package:provider/provider.dart';

import '../Model/JokeModel.dart';
import '../Providers/JokeProvider.dart';
import 'Widgets/LoadingWidget.dart';

class ActionsView extends StatelessWidget {
  const ActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<JokeProvider>(
    //     create: (_) => JokeProvider(),
    //     // we use `builder` to obtain a new `BuildContext` that has access to the provider
    //     builder:(buildContext,widget)
    //     {
    //       JokeModel? jokeModel = buildContext.read<JokeProvider>().getJokeModel;
    //       String  currentState = buildContext.read<JokeProvider>().getCurrentState;
    //       final Map<String, Widget> _appState = {
    //         'Loading': loadingWidget(),
    //         'LoadSetup':
    //         setupOrPunchlineText(jokeModel?.setup ?? "" " ((Tappable)) ",(){
    //           buildContext.read<JokeProvider>().loadPunchline();
    //         }),
    //         'LoadPunchline': setupOrPunchlineText(
    //             (jokeModel?.setup ?? "") + "\n" + (jokeModel?.punchline ?? ""),(){}),
    //       };
    //       return  _appState[currentState]??Container();
    //     }
    // );
    //--------------------------------------------------------------------------
    return ChangeNotifierProvider<JokeProvider>(
        create: (_) => JokeProvider(),
        // we use `builder` to obtain a new `BuildContext` that has access to the provider
        builder: (buildContext, widget) {
          return Consumer<JokeProvider>(
            builder: (context, jokeProvider, child) {
              JokeModel? jokeModel = jokeProvider.getJokeModel;
              String currentState = jokeProvider.getCurrentState;
              if (currentState == 'Loading')
                {
                  return loadingWidget();
                }
              else if (currentState == 'LoadSetup')
                {
                  return setupOrPunchlineText(
                      jokeModel?.setup ?? "" " ((Tappable)) ", () {
                    jokeProvider.loadPunchline();
                  });
                }

              else{
                return setupOrPunchlineText(
                    (jokeModel?.setup ?? "") +"\n\n"+
                        (jokeModel?.punchline ?? ""), () {});
              }

            },
          );
        }
    );
    //--------------------------------------------------------------------------
  }
}
