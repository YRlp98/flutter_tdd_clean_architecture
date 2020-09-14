import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_clean_architecture/core/error/failures.dart';
import 'package:flutter_tdd_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/entites/number_trivia.dart';

class getRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class NoParams extends Equatable {}
