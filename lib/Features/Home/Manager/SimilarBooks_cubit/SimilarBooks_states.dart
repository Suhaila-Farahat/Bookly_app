import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';

abstract class SimilarBooksState{}

class InitialSimilarBooksState extends SimilarBooksState {}

class LoadingSimilarBooksState extends SimilarBooksState {}

class SuccessSimilarBooksState extends SimilarBooksState {
  SuccessSimilarBooksState(this.booksList);

  final List<BookModel> booksList ;

}

class FailureSimilarBooksState extends SimilarBooksState {
  FailureSimilarBooksState({required this.errMsg});

  final String errMsg;
}