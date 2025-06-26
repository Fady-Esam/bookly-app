import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/repos/home_repo.dart';
import 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  void fetchSimilarBooks(String category) async {
    emit(SimilarBooksInitial());
    var res = await homeRepo.getSimilarBooks(category);
    res.fold((failure) {
      emit(SimilarBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
