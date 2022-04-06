import 'package:bot_toast/bot_toast.dart';
import 'package:cinemark_2/app/shared/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.darkTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
    );
  }
}
