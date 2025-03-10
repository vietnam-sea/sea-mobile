import 'package:dio/dio.dart';
import 'env_config.dart';

class BaseApiService {
  late Dio _dio;
  BaseApiService() {
    var baseUrl = EnvConfig.apiBaseUrl;
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        }));
    _dio.interceptors.addAll([
      _authorizationInterceptor(),
      _errorInterceptor(),
    ]);
  }

  InterceptorsWrapper _authorizationInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN';
        return handler.next(options);
      },
    );
  }

  InterceptorsWrapper _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401) {
          print("Unauthorized - handle token refresh or login");
        } else if (error.response?.statusCode == 500) {
          print("Server error - try again later");
        } else {
          print("Error occurred: ${error.message}");
        }
        return handler.next(error);
      },
    );
  }

  Future<Response?> getRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      print("GET request error: $e");
      return null;
    }
  }

  Future<Response?> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print("POST request error: $e");
      return null;
    }
  }
}
