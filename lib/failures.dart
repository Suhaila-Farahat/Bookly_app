import 'package:dio/dio.dart';

abstract class Failures {
  const Failures({required this.errMsg});
  final String errMsg;
}



class ServerFailure extends Failures {
  ServerFailure({required super.errMsg});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch(dioError.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMsg: 'Connection Timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMsg: 'Send Timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMsg: 'Receive Timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(errMsg: 'Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMsg: 'Connection Error');

      case DioExceptionType.unknown:
        return ServerFailure(errMsg: 'Error unknown');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMsg: 'badCertificate');

      default:
        return ServerFailure(errMsg: 'Oops ,There was an Error , Try again');
    }
  }

  factory ServerFailure.fromResponse( int statusCode , dynamic response){
    if (statusCode == 400 || statusCode == 401 || statusCode == 403  ){
      return ServerFailure(errMsg: response['error']['message']);
    }
    else if (statusCode == 404){
      return ServerFailure(errMsg: 'Your Request Not Found , Try again');
    }
    else if (statusCode == 500) {
      return ServerFailure(errMsg: 'Internal Server Error , Try again');
    }
    else {
      return ServerFailure(errMsg: 'Oops ,There was an Error , Try again');
    }
  }
}


