import 'package:bot_toast/bot_toast.dart';
import 'package:cinemark_2/app/modules/home/model/city.dart';
import 'package:cinemark_2/app/modules/home/model/states.dart';
import 'package:cinemark_2/app/modules/home/repository/api/ingresso_api.dart';
import 'package:cinemark_2/app/modules/home/repository/local/local_repository.dart';
import 'package:cinemark_2/app/shared/errors/error_handler.dart';
import 'package:cinemark_2/app/shared/errors/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  IngressoApi api = Modular.get();
  LocalRepository localRepository = Modular.get();
  ErrorHandler errorHandler = Modular.get();

  @observable
  String? ufStateSelected;

  @observable
  String? idCitySelected;

  @observable
  List<State> stateList = [];

  @computed
  List<City> get cityList {
    if (ufStateSelected == null) return [];
    return stateList.firstWhere((state) => state.uf == ufStateSelected).cities;
  }

  @action
  getData() async {
    BotToast.showLoading();
    try {
      final list = await api.getStates();
      stateList = list;
    } on Failure catch (e) {
      errorHandler.showErrorMessage(e);
    }

    ufStateSelected = await localRepository.getState();
    idCitySelected = await localRepository.getCityId();

    BotToast.closeAllLoading();
  }

  @action
  setState(String state) async {
    ufStateSelected = state;
    localRepository.saveState(state);

    setCity(null);
  }

  @action
  setCity(String? city) async {
    idCitySelected = city;
    localRepository.saveCityId(city);
  }
}
