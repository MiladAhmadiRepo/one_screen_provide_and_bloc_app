part of 'joke_bloc.dart';


abstract class JokeEvent extends Equatable {
  const JokeEvent();
}

class LoadJokeEvent extends JokeEvent {

  @override
  List<Object> get props => [];
}

class ClickSetup extends JokeEvent {
  final Joke joke;

  ClickSetup(this.joke);

  @override
  List<Object> get props => [joke];
}

class ReturnToStart extends JokeEvent {

  @override
  List<Object> get props => [];
}