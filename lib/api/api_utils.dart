import 'package:dio/dio.dart';

Dio _dio = Dio();

class ApiUtils {
  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    var result = _dio.get(url, queryParameters: queryParameters);
    return result;
  }
}
