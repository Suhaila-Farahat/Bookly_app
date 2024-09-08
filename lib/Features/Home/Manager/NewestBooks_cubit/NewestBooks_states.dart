import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';

abstract class NewestBooksState{}

class InitialNewestBooksState extends NewestBooksState {}

class LoadingNewestBooksState extends NewestBooksState {}

class SuccessNewestBooksState extends NewestBooksState {
  SuccessNewestBooksState(this.booksList);

  final List<BookModel> booksList ;

}

class FailureNewestBooksState extends NewestBooksState {
  FailureNewestBooksState({required this.errMsg});

  final String errMsg;
}