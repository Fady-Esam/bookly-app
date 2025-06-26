import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/repos/home_repo.dart';
import 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;

  void fetchSearchBooks(String name) async {
    emit(SearchBooksLoading());
    var res = await homeRepo.getSearchBooks(name);
    res.fold((failure) {
      emit(SearchBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
