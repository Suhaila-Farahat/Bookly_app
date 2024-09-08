import 'package:bookly_app/Features/Home/Data/repo/home_repo.dart';
import 'package:bookly_app/Features/Home/Manager/NewestBooks_cubit/NewestBooks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(InitialNewestBooksState());
  static NewestBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchingNewestBooks() async {
    emit(LoadingNewestBooksState());

    var result = await homeRepo.fetchNewestBooks();
    result.fold(
            (failure) => emit(FailureNewestBooksState(errMsg:failure.errMsg)),
            (books) => emit(SuccessNewestBooksState(books)));
  }
}