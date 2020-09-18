import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/entites/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Theows a [ServerExecption] for all error codes.
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTrivia> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

  @override
  Future<NumberTrivia> getConcreteNumberTrivia(int number) async {
    client.get(
      'http://numbersapi.com/$number',
      headers: {'Content-Type': 'application/json'},
    );
  }

  @override
  Future<NumberTrivia> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
