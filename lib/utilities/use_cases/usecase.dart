import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:yahoofin/yahoofin.dart';
import 'dart:core';
abstract class UseCase<Type, Params>{
  Future<Either<Failure,Type>> execute(Params params);
}