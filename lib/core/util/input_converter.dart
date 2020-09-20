import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean_architecture/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnSignedInteger(String str) {
    return Right(int.parse(str));
  }
}

class InvalidInputFailure extends Failure {}
