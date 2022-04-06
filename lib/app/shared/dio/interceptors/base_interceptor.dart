import 'package:cinemark_2/app/shared/errors/error_handler.dart';
import 'package:dio/dio.dart';

class BaseInterceptor extends Interceptor {
  final ErrorHandler errorHandler;
  BaseInterceptor(this.errorHandler);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //print("ERROR[${err.response?.statusCode}] => PATH: ${err.request?.path}");
    if (err.type == DioErrorType.response) {
      if (err.response!.statusCode == 404) {
        return handler.reject(
          DioError(
              error: 'Erro 404',
              requestOptions: err.requestOptions,
              type: DioErrorType.response),
        );
      }

      if (err.response!.statusCode == 500) {
        return handler.reject(
          DioError(
            error: 'Erro Interno da Api',
            requestOptions: err.requestOptions,
            type: DioErrorType.response,
          ),
        );
      }
    }

    return super.onError(err, handler);
  }
}
