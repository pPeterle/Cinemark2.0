import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

const boxName = 'cinemark';
const path = 'app/data';

const stateKey = 'state';
const cityKey = 'city';

class LocalRepository implements Disposable {
  final _complete = Completer<Box>();

  final StreamController<bool> _reloadData = StreamController<bool>();
  Stream get reloadData => _reloadData.stream;

  LocalRepository() {
    setup();
  }

  setup() async {
    await Hive.initFlutter(path);
    Hive.openBox(boxName).then((box) {
      _complete.complete(box);
    });
  }

  saveState(String state) async {
    final box = await _complete.future;
    box.put(stateKey, state);
  }

  Future<String?> getState() async {
    final box = await _complete.future;
    return box.get(stateKey);
  }

  saveCityId(String? cityId) async {
    final box = await _complete.future;
    _reloadData.sink.add(true);
    box.put(cityKey, cityId);
  }

  Future<String?> getCityId() async {
    final box = await _complete.future;
    return box.get(cityKey);
  }

  @override
  void dispose() {
    _reloadData.close();
  }
}
