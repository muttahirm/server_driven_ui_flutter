import 'package:dartz/dartz.dart';
import 'package:server_driven_ui_flutter/core/error/error.dart';
import '../entities/screen_entity.dart';

abstract class SDUIRepository {
  Future<Either<Failure, ScreenEntity>> getScreen(String screenName);
}
