class Failure implements Exception {
  final String message;

  Failure(this.message);
}

class ServerError implements Failure {
  final String _message;

  ServerError(this._message);

  @override
  String get message => _message;
}

class NetworkError implements Failure {
  final String _message;

  NetworkError(this._message);

  @override
  String get message => _message;
}
