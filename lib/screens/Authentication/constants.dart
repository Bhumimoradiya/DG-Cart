import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://192.168.0.123/Digi_Furniture/loginapi',
        data: {'email': email, 'password': password},
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }
}
