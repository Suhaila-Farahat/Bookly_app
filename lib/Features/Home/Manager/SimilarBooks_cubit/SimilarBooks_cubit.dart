import 'package:bookly_app/Features/Home/Data/repo/home_repo.dart';
import 'package:bookly_app/Features/Home/Manager/SimilarBooks_cubit/SimilarBooks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(InitialSimilarBooksState());
  static SimilarBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchingSimilarBooks({required String category}) async {
    emit(LoadingSimilarBooksState());

    var result = await homeRepo.fetchSimilarBooks(category : category);
    result.fold(
            (failure) => emit(FailureSimilarBooksState(errMsg:failure.errMsg)),
            (books) => emit(SuccessSimilarBooksState(books)));
  }
}