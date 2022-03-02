import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_screen_bloc_app/model/Joke.dart';
part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  Joke? joke;

  JokeBloc() : super(LoadingJokeState()) {
    on<JokeEvent>((event, emit) {
      if(event is LoadJokeEvent)
        {

        }
    });
  }
}
