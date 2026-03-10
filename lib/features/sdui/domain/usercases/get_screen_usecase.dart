import 'package:dartz/dartz.dart';
import 'package:server_driven_ui_flutter/core/error/error.dart';
import 'package:server_driven_ui_flutter/core/usecase/usecase.dart';
import 'package:server_driven_ui_flutter/features/sdui/domain/entities/screen_entity.dart';
import '../repository_abstractions/sdui_repository_abstraction.dart';

class GetScreenUseCase implements UseCase<ScreenEntity, String> {
  final SDUIRepository repository;

  GetScreenUseCase(this.repository);

  @override
  Future<Either<Failure, ScreenEntity>> call(String screenName) {
    return repository.getScreen(screenName);
  }
}
