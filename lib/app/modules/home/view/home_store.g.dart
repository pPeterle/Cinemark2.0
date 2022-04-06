// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$nowShowingListAtom = Atom(name: 'HomeStoreBase.nowShowingList');

  @override
  List<Movie> get nowShowingList {
    _$nowShowingListAtom.reportRead();
    return super.nowShowingList;
  }

  @override
  set nowShowingList(List<Movie> value) {
    _$nowShowingListAtom.reportWrite(value, super.nowShowingList, () {
      super.nowShowingList = value;
    });
  }

  final _$comingSoonListAtom = Atom(name: 'HomeStoreBase.comingSoonList');

  @override
  List<Movie> get comingSoonList {
    _$comingSoonListAtom.reportRead();
    return super.comingSoonList;
  }

  @override
  set comingSoonList(List<Movie> value) {
    _$comingSoonListAtom.reportWrite(value, super.comingSoonList, () {
      super.comingSoonList = value;
    });
  }

  final _$errorNowShowingAtom = Atom(name: 'HomeStoreBase.errorNowShowing');

  @override
  String? get errorNowShowing {
    _$errorNowShowingAtom.reportRead();
    return super.errorNowShowing;
  }

  @override
  set errorNowShowing(String? value) {
    _$errorNowShowingAtom.reportWrite(value, super.errorNowShowing, () {
      super.errorNowShowing = value;
    });
  }

  final _$showDialogNullCityErrorAtom =
      Atom(name: 'HomeStoreBase.showDialogNullCityError');

  @override
  bool get showDialogNullCityError {
    _$showDialogNullCityErrorAtom.reportRead();
    return super.showDialogNullCityError;
  }

  @override
  set showDialogNullCityError(bool value) {
    _$showDialogNullCityErrorAtom
        .reportWrite(value, super.showDialogNullCityError, () {
      super.showDialogNullCityError = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('HomeStoreBase.getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
nowShowingList: ${nowShowingList},
comingSoonList: ${comingSoonList},
errorNowShowing: ${errorNowShowing},
showDialogNullCityError: ${showDialogNullCityError}
    ''';
  }
}
