import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';


class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess({required this.books});
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure({required this.errMessage});
}

class SearchBooksLoading extends SearchBooksState {}
