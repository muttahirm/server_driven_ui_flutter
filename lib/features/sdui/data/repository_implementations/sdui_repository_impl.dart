import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/screen_entity.dart';
import '../../domain/repository_abstractions/sdui_repository_abstraction.dart';
import '../data_sources/sdui_remote_data_source.dart';

class SDUIRepositoryImpl implements SDUIRepository {
  final SduiRemoteDataSource remoteDataSource;

  SDUIRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ScreenEntity>> getScreen(String screenName) async {
    try {
      final result = await remoteDataSource.getScreen(screenName);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(UnknownFailure('Unknown error'));
    }
  }
}
