import 'package:dio/dio.dart';
import 'package:elevate_c3_sunday/core/values/api_endpoints.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
}
