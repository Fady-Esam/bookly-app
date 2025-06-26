import 'package:dartz/dartz.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly_app/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either< Failure, List<BookEntity>>> fetchFeaturedBooks({int pageIndex = 0});
  Future<Either< Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> getSimilarBooks(String category);
  Future<Either<Failure, List<BookEntity>>> getSearchBooks(String title);
}
