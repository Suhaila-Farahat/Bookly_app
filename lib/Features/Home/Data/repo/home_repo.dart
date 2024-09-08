import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures,List<BookModel>>> fetchBooks();
  Future<Either<Failures,List<BookModel>>> fetchNewestBooks();
  Future<Either<Failures,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failures,List<BookModel>>> searchBooks({required String category});
}