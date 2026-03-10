import 'package:server_driven_ui_flutter/core/error/error.dart';
import 'package:server_driven_ui_flutter/core/network/network.dart';

class ApiClient {
  final DioClient dioClient;

  ApiClient({required this.dioClient});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final dio = DioClient.create(
      baseUrl: 'https://api.example.com',
      getToken: () async {
        // Implement your token retrieval logic here
        return 'your_token';
      },
    );

    try {
      final response = await dio.get(endpoint);
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw ServerException('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw NetworkException('Failed to load data: $e');
    }
  }
}
