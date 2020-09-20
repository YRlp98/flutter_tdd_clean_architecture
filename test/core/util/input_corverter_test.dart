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
  });
}
