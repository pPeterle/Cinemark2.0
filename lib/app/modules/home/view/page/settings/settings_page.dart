import 'package:cinemark_2/app/shared/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'settings_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
        ),
        backgroundColor: CustomColors.darkBlue,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: CustomColors.darkBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selecione o Estado',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 18,
                    ),
                  ),
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text(
                        'Estado',
                        style: TextStyle(color: CustomColors.white),
                      ),
                      value: store.ufStateSelected,
                      style: const TextStyle(color: CustomColors.white),
                      items: store.stateList
                          .map((state) => DropdownMenuItem<String>(
                                child: Text(state.uf),
                                value: state.uf,
                              ))
                          .toList(),
                      onChanged: (value) {
                        store.setState(value!);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            color: CustomColors.darkBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selecione a Cidade',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 18,
                    ),
                  ),
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text(
                        'Cidade',
                        style: TextStyle(color: CustomColors.white),
                      ),
                      value: store.idCitySelected,
                      style: const TextStyle(color: CustomColors.white),
                      items: store.cityList
                          .map((city) => DropdownMenuItem<String>(
                                child: Text(city.name),
                                value: city.id,
                              ))
                          .toList(),
                      onChanged: (value) {
                        store.setCity(value!);
                      },
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
