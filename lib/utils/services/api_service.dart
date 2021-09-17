import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:record_me/utils/services/service_helper.dart';

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }

  factory ApiService() {
    return _apiUtil;
  }

  final dio = Dio();

  void init() {
    dio.options.baseUrl = kApiUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  Future<T?> request<T>(
    String endPoint,
    String method, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    try {
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParameters,
          options: Options(method: method, contentType: contentType, headers: {
            "": "",
          }));

      Fimber.i("status: ${response.statusCode}");
      Fimber.i("response is : $response");

      if (response.statusCode != 200) {
        Fimber.i("status: ${response.statusCode}");
        throw "status code error : ${response.statusCode}";
      }

      //Parse response
      // final dataModel = ResponseModel.fromJson(response.data);

    } catch (e) {
      Fimber.i("Error: $e");
      //TODO: Add alert dialogue
      return null;
    }
  }

}
