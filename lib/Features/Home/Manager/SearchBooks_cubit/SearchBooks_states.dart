import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';

abstract class SearchBooksState{}

class InitialSearchBooksState extends SearchBooksState {}

class LoadingSearchBooksState extends SearchBooksState {}

class SuccessSearchBooksState extends SearchBooksState {
  SuccessSearchBooksState(this.booksList);

  final List<BookModel> booksList ;

}

class FailureSearchBooksState extends SearchBooksState {
  FailureSearchBooksState({required this.errMsg});

  final String errMsg;
}