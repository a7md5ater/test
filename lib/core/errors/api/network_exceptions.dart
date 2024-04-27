import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test/core/errors/api/network_exception_types.dart';

abstract class NetworkExceptions implements Exception {
  String getMessage();

  static NetworkExceptions handleResponse(Response? response) {
    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return BadRequestException(errorMsg: "error message");
      case 401:
      case 403:
        return ForbiddenException(errorMsg: "error message");
      case 404:
        return NotFoundException(errorMsg: "NOT FOUND");
      case 406:
        return NotAcceptableException(errorMsg: "error message");

      case 408:
        return RequestTimeoutException(errorMsg: "error message");
      case 409:
        return ConflictException(errorMsg: "error message");
      case 415:
        return UnsupportedMediaTypeException(errorMsg: "error message");
      case 422:
        return UnprocessableEntityException(errorMsg: "error message");
      case 429:
        return TooManyRequestsException(errorMsg: "error message");
      case 500:
        return InternalServerErrorException(errorMsg: "error message");
      case 501:
        return BadGatewayException(errorMsg: "error message");
      case 503:
        return ServiceUnavailableException(errorMsg: "error message");
      case 596:
        return ServiceNotFoundException(errorMsg: "error message");
      default:
        return DefaultErrorException(
          errorMsg: "Received invalid status code: $statusCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions =
                  RequestCancelledException(errorMsg: "request cancelled");
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions =
                  RequestTimeoutException(errorMsg: "connection timeout");
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  NoInternetConnectionException(errorMsg: "unknown");
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions =
                  SendTimeoutException(errorMsg: "receive timeout");
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions =
                  SendTimeoutException(errorMsg: "send timeout");
              break;
            case DioExceptionType.badCertificate:
              networkExceptions =
                  BadCertificateException(errorMsg: "bad certificate");
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  ConnectionErrorException(errorMsg: "connection error");
              break;
          }
        } else if (error is SocketException) {
          networkExceptions =
              NoInternetConnectionException(errorMsg: "no internet connection");
        } else {
          networkExceptions =
              UnexpectedErrorException(errorMsg: "unexpected error");
        }
        return networkExceptions;
      } on FormatException {
        return FormatException(errorMsg: 'format exception');
      } catch (_) {
        return UnexpectedErrorException(errorMsg: "unexpected error");
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return UnableToProcessException(errorMsg: "unable to process");
      } else {
        return UnexpectedErrorException(errorMsg: "unexpected error");
      }
    }
  }
}
