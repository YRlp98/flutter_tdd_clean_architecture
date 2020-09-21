import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tdd_clean_architecture/core/util/input_converter.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/entites/number_trivia.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetTriviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test(
        'should call the InputConverter to validate and convert the string to an unsigned integer',
        () async {
      // arrange
      when(mockInputConverter.stringToUnSignedInteger(any))
          .thenReturn(Right(tNumberParsed));
      // act
      bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnSignedInteger(any));
      // assert
      verify(mockInputConverter.stringToUnSignedInteger(tNumberString));
    });

    test('should emit [Error] when the input is invalid', () async {
      // arrange
      when(mockInputConverter.stringToUnSignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));
      // act
      bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
      // assert
      final expected = [
        Empty(),
        Error(message: INVALID_FAILURE_MESSAGE),
      ];
      expectLater(bloc.state, emitsInOrder(expected));
    });
  });
}
