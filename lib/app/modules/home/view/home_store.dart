import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:cinemark_2/app/modules/home/model/carousel.dart';
import 'package:cinemark_2/app/modules/home/model/movie.dart';
import 'package:cinemark_2/app/modules/home/repository/api/ingresso_api.dart';
import 'package:cinemark_2/app/modules/home/repository/local/local_repository.dart';
import 'package:cinemark_2/app/shared/errors/error_handler.dart';
import 'package:cinemark_2/app/shared/errors/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../repository/errors/error.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

const nowShowingId = '2';
const comingSoonId = '1';

abstract class HomeStoreBase with Store implements Disposable {
  IngressoApi api = Modular.get();
  LocalRepository localRepository = Modular.get();
  ErrorHandler errorHandler = Modular.get();

  late StreamSubscription subscription;

  List<Carousel> carousel = [];

  @observable
  List<Movie> nowShowingList = [];
  @observable
  List<Movie> comingSoonList = [];

  @observable
  String? errorNowShowing;

  @observable
  bool showDialogNullCityError = false;

  HomeStoreBase() {
    subscription = localRepository.reloadData.listen((event) {
      getData();
    });
  }

  @action
  getData() async {
    BotToast.showLoading();
    try {
      errorNowShowing = null;
      showDialogNullCityError = false;

      final data = await api.getCarousel();
      carousel = data;

      final showing = carousel.where((c) => c.id == nowShowingId).toList();
      if (showing.isEmpty) {
        errorNowShowing = 'Não possui filmes em cartaz';
      } else {
        nowShowingList = showing[0].events;
      }

      final comingSoon = carousel.where((c) => c.id == comingSoonId).toList();
      comingSoonList = comingSoon[0].events;
    } on NullCityIdError {
      showDialogNullCityError = true;
    } on Failure catch (e) {
      errorHandler.showErrorMessage(e);
    }
    BotToast.closeAllLoading();
  }

  @override
  void dispose() {
    subscription.cancel();
  }
}
