import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call([Parameters parameters]);
}

class NoParameters {}
