import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/Data/repo/home_repo.dart';
import 'package:bookly_app/Features/Home/Manager/Books_cubit/Books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo,) : super(InitialBooksState());
  static BooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  BookModel? bookModel ;

  Future<void> fetchingBooks() async {
    emit(LoadingBooksState());

    var result = await homeRepo.fetchBooks();
    result.fold(
            (failure) => emit(FailureBooksState(errMsg: failure.errMsg)),
            (books) => emit(SuccessBooksState(books)));
  }
}
