import '../../../domain/entities/book_entity.dart';

class NewestBooksState {}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> newestBooks;

  NewestBooksSuccessState({required this.newestBooks});
}

class NewestBooksFailureState extends NewestBooksState {
  final String errMessage;

  NewestBooksFailureState({required this.errMessage});
}
