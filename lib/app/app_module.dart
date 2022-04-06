import 'package:cinemark_2/app/shared/dio/custom_dio.dart';
import 'package:cinemark_2/app/shared/errors/error_handler.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'shared/dio/interceptors/base_interceptor.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CustomDio(i.get())),
    Bind.singleton((i) => BaseInterceptor(i.get())),
    Bind.singleton((i) => ErrorHandler())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
