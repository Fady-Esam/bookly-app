import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var res = await dio.get(baseUrl + endPoint);
    return res.data;
  }
}

