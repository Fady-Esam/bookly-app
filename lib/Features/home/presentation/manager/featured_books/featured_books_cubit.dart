import '../../../domain/use_cases/fetch_featured_books_use_case.dart';
import 'featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchFeaturedBooksUseCase})
      : super(FeaturedBooksInitialState());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageIndex = 0}) async {
    if (pageIndex == 0) {
      emit(FeaturedBooksLoadingState());
    } else {
      emit(FeaturedBooksPaginationLoadingState());
    }
    var res = await fetchFeaturedBooksUseCase.call(pageIndex);
    res.fold((failure) {
      if (pageIndex == 0) {
        emit(FeaturedBooksFailureState(errMessage: failure.errMessage));
      } else {
        emit(FeaturedBooksPaginationFailureState(
            errMessage: failure.errMessage));
      }
    }, (featuredBooks) {
      emit(FeaturedBooksSuccessState(featuredBooks: featuredBooks));
    });
  }
}
