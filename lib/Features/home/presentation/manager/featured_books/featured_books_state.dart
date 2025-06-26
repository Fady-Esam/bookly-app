import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';

class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksPaginationFailureState({required this.errMessage});
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> featuredBooks;

  FeaturedBooksSuccessState({required this.featuredBooks});
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailureState({required this.errMessage});
}
