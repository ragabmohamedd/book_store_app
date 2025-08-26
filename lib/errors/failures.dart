import 'package:dio/dio.dart';

abstract class Failures {
  final String errMassage;

  const Failures(this.errMassage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMassage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('connectionError');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');
      // ignore: unreachable_switch_default
      default:
        return ServerFailure('opps server was an error , please try agin');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error, please try agin');
    } else {
      return ServerFailure('opps server was an error , please try agin');
    }
  }
}
