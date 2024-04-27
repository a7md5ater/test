import 'package:test/core/errors/api/network_exceptions.dart';

enum NetworkErrorTypes { noInternetConnection, api }

abstract class Failure {
  String getMessage();
}

class NoInternetConnection implements Exception {}

class FailureBody {
  final String message;

  FailureBody({required this.message});
}

class ServerFailure extends Failure {
  final Exception error;
  final NetworkErrorTypes type;

  ServerFailure({
    required this.error,
    required this.type,
  });

  FailureBody handleException(e) {
    FailureBody result;
    switch (type) {
      case NetworkErrorTypes.noInternetConnection:
        result = FailureBody(
            message:
                "There is no internet connection, please check your connection and try again later.");
        break;
      case NetworkErrorTypes.api:
        result = FailureBody(
          message: NetworkExceptions.getDioException(error).getMessage(),
        );
        break;
      default:
        result = e;
    }
    return result;
  }

  @override
  String getMessage() => handleException(error).message;
}
