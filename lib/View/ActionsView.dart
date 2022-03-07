import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:one_screen_packages/Constants/BaseConstants.dart';
import 'package:one_screen_packages/Model/JokeModel.dart';
import 'package:one_screen_packages/Utils/ConnectivityService.dart';
import 'package:one_screen_packages/Widgets/ContainBox.dart';
import 'package:one_screen_packages/Widgets/CustomDialogBox.dart';
import 'package:one_screen_packages/Widgets/LoadingWidget.dart';
import 'package:one_screen_packages/Widgets/SetupOrPunchlineText.dart';
import 'package:one_screen_packages/Widgets/StaticText.dart';
import 'package:provider/provider.dart';
import '../Providers/JokeProvider.dart';

class ActionsView extends StatelessWidget {
  const ActionsView({Key? key}) : super(key: key);

  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ConnectivityService().connectivityStream.stream,
      builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
        return snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi
            ? ChangeNotifierProvider<JokeProvider>(
                create: (_) => JokeProvider(),
                builder: (buildContext, widget) {
                  return Consumer<JokeProvider>(
                    builder: (context, jokeProvider, child) {
                      String currentState =
                          buildContext.read<JokeProvider>().getCurrentState;
                      final Map<String, Widget> _appState = {
                        'Loading': loadingWidget(),
                        'LoadSetup': setupWidget(jokeProvider),
                        'LoadPunchline': punchlineWidget(jokeProvider)
                      };
                      return _appState[currentState] ?? Container();
                    },
                  );
                })
            : const CustomDialogBox(
                descriptions: "CHECK YOUR INTERNET CONNECTION",
                title: "Connection Status",
                text: "Ok",
              );
      },
    );
  }

  //--------------------------------------------------------------------------
  Widget setupWidget(JokeProvider jokeProvider) {
    JokeModel jokeModel = jokeProvider.getJokeModel;
    String setupText = jokeModel.setup ?? "";
    return ContainBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          SetupOrPunchlineWidget(setupText,
              clicked: jokeProvider.loadPunchline, visible: true),
        ],
      ),
      titleText: "Tappable",
    );
  }

  //--------------------------------------------------------------------------

  Widget punchlineWidget(JokeProvider jokeProvider) {
    JokeModel jokeModel = jokeProvider.getJokeModel;
    String setupText = jokeModel.setup ?? "";
    String punchlineText = jokeModel.punchline ?? "";
    return ContainBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          StaticText(setupText),
          const SizedBox(
            height: 10,
          ),
          SetupOrPunchlineWidget(
            punchlineText + BaseConstants.smileText,
          ),
        ],
      ),
      titleText: "",
    );
  }
//--------------------------------------------------------------------------

}
