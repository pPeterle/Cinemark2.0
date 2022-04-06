import 'package:cinemark_2/app/shared/dio/interceptors/base_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../urls.dart';

class CustomDio extends DioForNative {
  CustomDio(BaseInterceptor baseInterceptor)
      : super(BaseOptions(baseUrl: baseUrl)) {
    interceptors.add(baseInterceptor);
  }
}
