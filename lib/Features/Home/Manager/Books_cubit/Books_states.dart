import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';

abstract class BooksState{}

class InitialBooksState extends BooksState {}

class LoadingBooksState extends BooksState {}

class SuccessBooksState extends BooksState {
  SuccessBooksState(this.booksList);

  final List<BookModel> booksList ;

}

class FailureBooksState extends BooksState {
  FailureBooksState({required this.errMsg});

  final String errMsg;
}