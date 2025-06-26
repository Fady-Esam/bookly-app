import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';


class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess({required this.books});
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure({required this.errMessage});
}

class SimilarBooksLoading extends SimilarBooksState {}
