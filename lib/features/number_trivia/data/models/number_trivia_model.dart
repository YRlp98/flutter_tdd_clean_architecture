import 'package:flutter/foundation.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/entites/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);
}
