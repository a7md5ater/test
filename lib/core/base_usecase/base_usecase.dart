import 'package:dartz/dartz.dart';
import 'package:test/core/errors/failures.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
