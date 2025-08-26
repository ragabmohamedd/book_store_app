import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.jsonbin.io/v3/qs/68ab3e93ae596e708fd3bfd7';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get('$_baseUrl');
    return response.data;
  }
}
