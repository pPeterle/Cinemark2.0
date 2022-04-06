// Mocks generated by Mockito 5.1.0 from annotations
// in cinemark_2/test/home/repository/ingresso_api_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:cinemark_2/app/modules/home/repository/local/local_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [LocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalRepository extends _i1.Mock implements _i2.LocalRepository {
  MockLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<dynamic> get reloadData =>
      (super.noSuchMethod(Invocation.getter(#reloadData),
          returnValue: Stream<dynamic>.empty()) as _i3.Stream<dynamic>);
  @override
  dynamic saveState(String? state) =>
      super.noSuchMethod(Invocation.method(#saveState, [state]));
  @override
  _i3.Future<String?> getState() =>
      (super.noSuchMethod(Invocation.method(#getState, []),
          returnValue: Future<String?>.value()) as _i3.Future<String?>);
  @override
  _i3.Future<String?> getCityId() =>
      (super.noSuchMethod(Invocation.method(#getCityId, []),
          returnValue: Future<String?>.value()) as _i3.Future<String?>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
