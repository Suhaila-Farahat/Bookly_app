import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/Data/repo/home_repo.dart';
import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo,) : super(InitialSearchBooksState());
  static SearchBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  BookModel? bookModel ;

  Future<void> searchingBooks({required String category}) async {
    emit(LoadingSearchBooksState());

    var result = await homeRepo.searchBooks(category: category);
    result.fold(
            (failure) => emit(FailureSearchBooksState(errMsg: failure.errMsg)),
            (books) => emit(SuccessSearchBooksState(books)));
  }
}
