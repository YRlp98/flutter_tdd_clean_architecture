part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  // const NumberTriviaEvent();

  // @override
  // List<Object> get props => [];

  NumberTriviaEvent([List props = const <dynamic>[]]) : super(props);
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
