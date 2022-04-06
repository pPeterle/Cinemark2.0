import 'package:cinemark_2/app/shared/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';
import 'page/breve_page.dart';
import 'page/cartaz_page..dart';
import 'widgets/custom_animated_switcher_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    store.getData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cinemark',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/settings');
            },
            icon: const Icon(Icons.settings),
          )
        ],
        backgroundColor: CustomColors.background,
      ),
      body: Observer(
        builder: (_) {
          if (store.showDialogNullCityError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Acesse as configurações para selecionar a cidade',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CustomColors.red, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Modular.to.pushNamed('/settings');
                        },
                        child: const Text('Abrir'))
                  ],
                ),
              ),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      CustomAnimatedSwitcher(pageController: _pageController),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: <Widget>[const CartazPage(), BrevePage()],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
