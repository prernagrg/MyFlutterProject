import 'package:fpdart/fpdart.dart';
import 'package:learn/core/error/failures.dart';

abstract interface class Usecase<SuccessType, Parameters> {
  Future<Either<Failure, SuccessType>> call(Parameters params);
}
