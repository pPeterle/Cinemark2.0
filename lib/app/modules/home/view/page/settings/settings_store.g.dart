// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  Computed<List<City>>? _$cityListComputed;

  @override
  List<City> get cityList =>
      (_$cityListComputed ??= Computed<List<City>>(() => super.cityList,
              name: '_SettingsStoreBase.cityList'))
          .value;

  final _$ufStateSelectedAtom =
      Atom(name: '_SettingsStoreBase.ufStateSelected');

  @override
  String? get ufStateSelected {
    _$ufStateSelectedAtom.reportRead();
    return super.ufStateSelected;
  }

  @override
  set ufStateSelected(String? value) {
    _$ufStateSelectedAtom.reportWrite(value, super.ufStateSelected, () {
      super.ufStateSelected = value;
    });
  }

  final _$idCitySelectedAtom = Atom(name: '_SettingsStoreBase.idCitySelected');

  @override
  String? get idCitySelected {
    _$idCitySelectedAtom.reportRead();
    return super.idCitySelected;
  }

  @override
  set idCitySelected(String? value) {
    _$idCitySelectedAtom.reportWrite(value, super.idCitySelected, () {
      super.idCitySelected = value;
    });
  }

  final _$stateListAtom = Atom(name: '_SettingsStoreBase.stateList');

  @override
  List<State> get stateList {
    _$stateListAtom.reportRead();
    return super.stateList;
  }

  @override
  set stateList(List<State> value) {
    _$stateListAtom.reportWrite(value, super.stateList, () {
      super.stateList = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_SettingsStoreBase.getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$setStateAsyncAction = AsyncAction('_SettingsStoreBase.setState');

  @override
  Future setState(String state) {
    return _$setStateAsyncAction.run(() => super.setState(state));
  }

  final _$setCityAsyncAction = AsyncAction('_SettingsStoreBase.setCity');

  @override
  Future setCity(String? city) {
    return _$setCityAsyncAction.run(() => super.setCity(city));
  }

  @override
  String toString() {
    return '''
ufStateSelected: ${ufStateSelected},
idCitySelected: ${idCitySelected},
stateList: ${stateList},
cityList: ${cityList}
    ''';
  }
}
