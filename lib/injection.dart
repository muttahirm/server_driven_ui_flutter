import 'package:server_driven_ui_flutter/core/network/network.dart';
import 'package:server_driven_ui_flutter/features/sdui/data/data_sources/sdui_remote_data_source.dart';
import 'package:server_driven_ui_flutter/features/sdui/data/repository_implementations/sdui_repository_impl.dart';
import 'package:server_driven_ui_flutter/features/sdui/domain/usercases/get_screen_usecase.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/state_management/sdui_bloc/sdui_bloc.dart';

class Injection {
  static late final DioClient dioClient;
  static late final ApiClient apiClient;
  static late final SduiRemoteDataSource remoteDataSource;
  static late final SDUIRepositoryImpl repository;
  static late final GetScreenUseCase getScreenUseCase;
  static late final SduiBloc sduiBloc;

  static Future<void> init() async {
    dioClient =
        DioClient.create(
              baseUrl: 'https://your-api.com',
              getToken: () async => null,
            )
            as DioClient;
    apiClient = ApiClient(dioClient: dioClient);

    remoteDataSource = SduiRemoteDataSourceImpl(apiClient);
    repository = SDUIRepositoryImpl(remoteDataSource);
    getScreenUseCase = GetScreenUseCase(repository);
    sduiBloc = SduiBloc(getScreenUseCase);
  }
}
