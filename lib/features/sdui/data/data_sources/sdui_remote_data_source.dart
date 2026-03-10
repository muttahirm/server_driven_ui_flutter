import '../../../../core/network/api_client.dart';
import '../data_models/screen_model.dart';

abstract class SduiRemoteDataSource {
  Future<ScreenModel> getScreen(String screenName);
}

class SduiRemoteDataSourceImpl implements SduiRemoteDataSource {
  final ApiClient apiClient;

  SduiRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ScreenModel> getScreen(String screenName) async {
    final json = await apiClient.get('/screens/$screenName');
    return ScreenModel.fromJson(json);
  }
}
