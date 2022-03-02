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
  @override
  List<Object> get props => [];
}

class PunchlineJokeState extends JokeState {
  @override
  List<Object> get props => [];
}