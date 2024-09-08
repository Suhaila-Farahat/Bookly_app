import 'package:dio/dio.dart';

class Api{
  Api(this.dio);

  final Dio dio;
  final baseUrl = 'https://www.googleapis.com/books/v1/';


  Future<Map<String,dynamic>> get ({required String url}) async{
    Response response = await dio.get('$baseUrl$url');
    return response.data;
  }
}