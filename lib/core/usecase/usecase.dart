import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/failure.dart';

abstract class UseCase<Request, Response> {
  Future<Either<Failure, Response>> call(Request request);
}
