import 'package:dio/dio.dart';

class APIService {
  final Dio _dio;

  APIService() : _dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      Response response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    try {
      Response response = await _dio.put(url, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      Response response = await _dio.delete(url);
      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}