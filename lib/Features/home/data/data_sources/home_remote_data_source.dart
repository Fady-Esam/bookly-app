import 'package:dartz/dartz.dart';
import 'package:new_bookly_app/core/errors/failure.dart';

import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchRemoteFeaturedBooks({int pageIndex = 0});
  Future<List<BookEntity>> fetchRemoteNewestBooks();
  Future<Either<Failure, List<BookModel>>> getSimilarBooks(String category);
  Future<Either<Failure, List<BookModel>>> getSearchBooks(String title);
}
