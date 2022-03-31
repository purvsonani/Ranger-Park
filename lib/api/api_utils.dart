import 'package:dio/dio.dart';
import 'package:ranger_park/core/utils/string_constants.dart';

Dio _dio = Dio();

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    var result = _dio.get(url, queryParameters: queryParameters);
    return result;
  }

  Future<Response> post(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    var result = _dio.post(url, queryParameters: queryParameters);
    return result;
  }

  String getNetworkError() {
    return ConstantsStrings.network_error;
  }
}
