import 'package:test/core/errors/api/network_exceptions.dart';

class RequestCancelledException implements NetworkExceptions {
  final String errorMsg;

  RequestCancelledException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class BadRequestException implements NetworkExceptions {
  final String errorMsg;

  BadRequestException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class UnauthorizedRequestException implements NetworkExceptions {
  final String errorMsg;

  UnauthorizedRequestException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ForbiddenException implements NetworkExceptions {
  final String errorMsg;

  ForbiddenException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class NotFoundException implements NetworkExceptions {
  final String errorMsg;

  NotFoundException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class NotAcceptableException implements NetworkExceptions {
  final String errorMsg;

  NotAcceptableException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class UnsupportedMediaTypeException implements NetworkExceptions {
  final String errorMsg;

  UnsupportedMediaTypeException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class TooManyRequestsException implements NetworkExceptions {
  final String errorMsg;

  TooManyRequestsException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class InternalServerErrorException implements NetworkExceptions {
  final String errorMsg;

  InternalServerErrorException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class BadGatewayException implements NetworkExceptions {
  final String errorMsg;

  BadGatewayException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ServiceUnavailableException implements NetworkExceptions {
  final String errorMsg;

  ServiceUnavailableException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ServiceNotFoundException implements NetworkExceptions {
  final String errorMsg;

  ServiceNotFoundException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class MethodNotAllowedException implements NetworkExceptions {
  final String errorMsg;

  MethodNotAllowedException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class RequestTimeoutException implements NetworkExceptions {
  final String errorMsg;

  RequestTimeoutException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class SendTimeoutException implements NetworkExceptions {
  final String errorMsg;

  SendTimeoutException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class BadCertificateException implements NetworkExceptions {
  final String errorMsg;

  BadCertificateException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ConnectionErrorException implements NetworkExceptions {
  final String errorMsg;

  ConnectionErrorException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ReceiveTimeoutException implements NetworkExceptions {
  final String errorMsg;

  ReceiveTimeoutException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class UnprocessableEntityException implements NetworkExceptions {
  final String errorMsg;

  UnprocessableEntityException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class ConflictException implements NetworkExceptions {
  final String errorMsg;

  ConflictException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class NotImplementedException implements NetworkExceptions {
  final String errorMsg;

  NotImplementedException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class NoInternetConnectionException implements NetworkExceptions {
  final String errorMsg;

  NoInternetConnectionException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class FormatException implements NetworkExceptions {
  final String errorMsg;

  FormatException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class UnableToProcessException implements NetworkExceptions {
  final String errorMsg;

  UnableToProcessException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class DefaultErrorException implements NetworkExceptions {
  final String errorMsg;

  DefaultErrorException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}

class UnexpectedErrorException implements NetworkExceptions {
  final String errorMsg;

  UnexpectedErrorException({required this.errorMsg});
  @override
  String getMessage() => errorMsg;
}
