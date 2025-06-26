import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Unexpected error, please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.data, dioException.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to Api server not found');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unexpected error, please try again');
      default:
        return ServerFailure(
            errMessage: 'Opps there was an error, please try again');
    }
  }

  factory ServerFailure.fromResponse(response, int? statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, please try again');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error, please try again');
    } else {
      return ServerFailure(
          errMessage: 'Opps there was an error, please try again');
    }
  }
}
