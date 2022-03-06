part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();
}

class LoadingJokeState extends JokeState {
  @override
  List<Object> get props => [];
}

class ErrorJokeState extends JokeState {
  @override
  List<Object> get props => [];
}

class SetupJokeState extends JokeState {
  final JokeModel jokeModel;
  const SetupJokeState({required this.jokeModel});

  @override
  List<Object> get props => [jokeModel];
}

class PunchlineJokeState extends JokeState {
  final String punchline;
  const PunchlineJokeState({required this.punchline});

  @override
  List<Object> get props => [punchline];
}