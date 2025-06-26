import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:new_bookly_app/core/errors/failure.dart';

import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageIndex = 0}) async {
    try {
      List<BookEntity> featuredBooks;
      featuredBooks =
          homeLocalDataSource.fetchLocalFeaturedBooks(pageIndex: pageIndex);
      if (featuredBooks.isNotEmpty) {
        return right(featuredBooks);
      }
      featuredBooks = await homeRemoteDataSource.fetchRemoteFeaturedBooks(
        pageIndex: pageIndex,
      );
      return right(featuredBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> newestLocalBooks =
          homeLocalDataSource.fetchLocalNewestBooks();
      if (newestLocalBooks.isNotEmpty) {
        return right(newestLocalBooks);
      }
      List<BookEntity> newestRemoteBooks =
          await homeRemoteDataSource.fetchRemoteNewestBooks();
      return right(newestRemoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getSimilarBooks(
      String category) async {
    try {
      List<BookEntity> similarLocalBooks =
          homeLocalDataSource.fetchLocalSimilarBooks();
      if (similarLocalBooks.isNotEmpty) {
        return right(similarLocalBooks);
      }
      var result = await homeRemoteDataSource.getSimilarBooks(category);
      return result.fold(
        (failure) => left(ServerFailure(errMessage: failure.errMessage)),
        (books) => right(books),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<BookEntity>>> getSearchBooks(String title) async {
    try {
      List<BookEntity> searchedLocalBooks =
          homeLocalDataSource.fetchLocalSearchedBooks();
      if (searchedLocalBooks.isNotEmpty) {
        return right(searchedLocalBooks);
      }
      var result = await homeRemoteDataSource.getSearchBooks(title);
      return result.fold(
        (failure) => left(ServerFailure(errMessage: failure.errMessage)),
        (books) => right(books),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
