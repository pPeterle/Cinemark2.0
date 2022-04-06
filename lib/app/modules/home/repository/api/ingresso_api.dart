import 'dart:async';

import 'package:cinemark_2/app/modules/home/model/carousel.dart';
import 'package:cinemark_2/app/modules/home/model/states.dart';
import 'package:cinemark_2/app/modules/home/repository/errors/error.dart';
import 'package:cinemark_2/app/modules/home/repository/local/local_repository.dart';
import 'package:cinemark_2/app/shared/errors/errors.dart';
import 'package:dio/dio.dart';

class IngressoApi {
  final Dio _dio;
  final LocalRepository _localRepository;

  IngressoApi(this._dio, this._localRepository);

  Future<List<State>> getStates() async {
    try {
      final result = await _dio.get<List>('states');
      final list = result.data!.map((state) => State.fromJson(state)).toList();

      return list;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw ServerError(e.message);
      }
      throw NetworkError('Erro de conexão com a internet');
    } catch (e) {
      throw Failure('Algum Erro aconteceu');
    }
  }

  Future<List<Carousel>> getCarousel() async {
    try {
      print('get carousel');
      final cityId = await _localRepository.getCityId();
      print(cityId);
      if (cityId == null) {
        throw NullCityIdError();
      }

      final result =
          await _dio.get<List>('/carousel/$cityId/partnership/cinemark');
      return result.data!
          .map((carousel) => Carousel.fromJson(carousel))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw ServerError(e.message);
      }
      throw NetworkError('Erro de conexão com a internet');
    } on NullCityIdError {
      rethrow;
    } catch (e) {
      throw Failure('Algum Erro aconteceu');
    }
  }
}
