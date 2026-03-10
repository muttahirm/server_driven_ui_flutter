import 'package:dartz/dartz.dart';
import 'package:server_driven_ui_flutter/core/error/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
