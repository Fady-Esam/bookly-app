

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestdBooksUseCase}) : super(NewestBooksInitialState());
    final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;

  Future<void> fetchNewestdBooks() async {
    emit(NewestBooksLoadingState());
    var res = await fetchNewestdBooksUseCase.call();
    res.fold((failure) {
      emit(NewestBooksFailureState(errMessage: failure.errMessage));
    }, (newestBooks) {
      emit(NewestBooksSuccessState(newestBooks: newestBooks));
    });
  }
}
