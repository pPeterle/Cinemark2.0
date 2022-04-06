import 'package:cinemark_2/app/shared/errors/errors.dart';

class NullCityIdError implements Failure {
  @override
  String get message => 'Selecione a cidade que deseja ver os filmes';
}
