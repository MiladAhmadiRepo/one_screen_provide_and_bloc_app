part of 'joke_bloc.dart';


abstract class JokeEvent extends Equatable {
  const JokeEvent();
}

class LoadingJokeEvent extends JokeEvent {
  @override
  List<Object> get props => [];
}

class RetrieveJokeEvent extends JokeEvent {
  final JokeModel jokeModel;
  RetrieveJokeEvent(this.jokeModel);

  @override
  List<Object> get props => [jokeModel];
}

class ClickSetupEvent extends JokeEvent {
  final JokeModel jokeModel;
  ClickSetupEvent(this.jokeModel);

  @override
  List<Object> get props => [jokeModel];
}

class ReturnToStartEvent extends JokeEvent {
  @override
  List<Object> get props => [];
}