import 'package:dio/dio.dart';

const String _baseUrl = "http://demo6772422.mockable.io";

class ApiClient {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  ApiClient._();

  static ApiClient? _instance;

  static ApiClient get shared => _instance ??= ApiClient._();
}
