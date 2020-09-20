import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:flutter_tdd_clean_architecture/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return an integer when the string represents an unsigned intger',
        () async {
      // arrange
      final str = '123';
      // act
      final result = inputConverter.stringToUnSignedInteger(str);
      // assert
      expect(result, Right(123));
    });

    test('should return a failure when the string is not an integer', () async {
      // arange
      final str = 'abc';
      // act
      final result = inputConverter.stringToUnSignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });

    test('should return a failure when the string is a negative integer',
        () async {
      // arange
      final str = '-123';
      // act
      final result = inputConverter.stringToUnSignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
