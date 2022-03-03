import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_screen_bloc_app/Api/JokeApi.dart';

import '../model/joke_model.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {

  JokeBloc() : super(LoadingJokeState()) {
    on<LoadingJokeEvent>(_onLoadingJoke);
    on<RetrieveJokeEvent>(_onRetrieveJoke);
    on<ClickSetupEvent>(_onClickSetup);
    on<ReturnToStartEvent>(_onReturnToStart);
  }

  Future<void> _onLoadingJoke(LoadingJokeEvent event, Emitter<JokeState> emit) async {
    emit(LoadingJokeState());
    JokeApi().fetchJoke().then((value) => emit(SetupJokeState(jokeModel: value)));
  }

  void _onRetrieveJoke(RetrieveJokeEvent event, Emitter<JokeState> emit) {
    if (state is LoadingJokeState) {
      event.jokeModel.setup!.isNotEmpty
          ? emit(SetupJokeState(jokeModel: event.jokeModel))
          : emit(ErrorJokeState());
    }
  }

  void _onClickSetup(ClickSetupEvent event, Emitter<JokeState> emit) {
    emit(PunchlineJokeState(punchline: event.jokeModel.punchline!));
    Future.delayed(const Duration(seconds: 3),(){
      add(ReturnToStartEvent());
    });
  }

  void _onReturnToStart(ReturnToStartEvent event, Emitter<JokeState> emit) {
    if (state is PunchlineJokeState) emit(LoadingJokeState());
  }
}
