import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/Data/repo/home_repo.dart';
import 'package:bookly_app/api_Services.dart';
import 'package:bookly_app/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo{
  HomeRepoImplementation(this.api);

  final Api api ;

  @override
  Future<Either<Failures, List<BookModel>>> fetchBooks() async {

    try {
      var data = await api.get(url:'volumes?q=subject:health&Filtering=free-ebooks');

      List<BookModel> booksList = [];

      for(var item in data['items']){
        booksList.add(BookModel.fromJson(item));
      }

      return right(booksList) ;

    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMsg: e.toString()));
    }
  }


  @override
  Future<Either<Failures,List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await api.get(url:'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest');

      List<BookModel> booksList = [];

      for(var item in data['items']){
        booksList.add(BookModel.fromJson(item));
      }

      return right(booksList) ;

    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMsg: e.toString())) ;
    }

  }


  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category}) async {

    try {
      var data = await api.get(url:'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=relevance');

      List<BookModel> booksList = [];

      for(var item in data['items']){
        booksList.add(BookModel.fromJson(item));
      }

      return right(booksList) ;

    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMsg: e.toString())) ;
    }

  }

  @override
  Future<Either<Failures, List<BookModel>>> searchBooks({required String category}) async {
    try {
      var data = await api.get(url:'volumes?q=subject:$category&Filtering=free-ebooks');

      List<BookModel> booksList = [];

      for(var item in data['items']){
        booksList.add(BookModel.fromJson(item));
      }

      return right(booksList) ;

    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMsg: e.toString())) ;
    }
  }

}