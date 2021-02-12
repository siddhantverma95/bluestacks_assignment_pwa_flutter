import 'package:dio/dio.dart';

class RestClient {
  Dio _dio;

  RestClient() {
    var options = BaseOptions(connectTimeout: 10000, receiveTimeout: 30000);
    _dio = Dio(options);
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(String path, [Map<String, dynamic> data]) async {
    return _dio.get(path, queryParameters: data);
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return _dio.post(path, data: data);
  }

  Future<Response> postFormData(String path, FormData data) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, [Map<String, dynamic> data]) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path, [Map<String, dynamic> data]) async {
    return _dio.delete(path, data: data);
  }
}

abstract class ApiOptions {
  Options options = Options();
}

// Public API options need to be sent with public request required few public headers
class PublicApiOptions extends ApiOptions {
  PublicApiOptions() {
    super.options.headers = <String, dynamic>{
      "Content-Type": "application/JSON",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
  }
}

// Protected API options need to be sent with public request required few private headers
class ProtectedApiOptions extends ApiOptions {
  ProtectedApiOptions(String apiToken) {
    super.options.headers = <String, dynamic>{
      "Content-Type": "application/JSON",
      "x-access-token": apiToken,
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
  }
}
