import 'package:cinemark_2/app/modules/home/repository/api/ingresso_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'repository/local/local_repository.dart';
import 'view/home_page.dart';
import 'view/home_store.dart';
import 'view/page/settings/settings_page.dart';
import 'view/page/settings/settings_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => SettingsStore()),
    Bind.singleton((i) => IngressoApi(i.get(), i.get())),
    Bind.singleton((i) => LocalRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/settings', child: (_, args) => const SettingsPage()),
  ];
}
