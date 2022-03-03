import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_screen_bloc_app/Bloc/joke_bloc.dart';


class ActionsView extends StatefulWidget {
  const ActionsView({Key? key}) : super(key: key);

  @override
  State<ActionsView> createState() => _ActionsViewState();
}

class _ActionsViewState extends State<ActionsView> {

 late JokeBloc _jokeBloc;

  @override
  void initState() {
    _jokeBloc = JokeBloc();
    _jokeBloc.add(LoadingJokeEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      bloc: _jokeBloc,
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is LoadingJokeState) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
            if (state is SetupJokeState) ...[
                Center(
                child: GestureDetector(
                    onTap: () {
                      context.read<JokeBloc>().add(ClickSetupEvent(state.jokeModel));
                    },
                    child: Text("data")
                )
              )
            ],

            if (state is PunchlineJokeState) ...[
              Text("data"),
            ]
          ],
        );
      },
    );
  }
}
