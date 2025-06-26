import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/core/errors/failure.dart';

import '../../../../core/utils/api_service.dart';
import '../../domain/entities/book_entity.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchRemoteFeaturedBooks({int pageIndex = 0}) async {
    List<BookEntity> featuredBooks = [];
    var res = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageIndex * 10}');
    for (var e in res['items']) {
      featuredBooks.add(BookModel.fromJson(e));
    }
    var booksBox = Hive.box<BookEntity>('featuredBooks');
    await booksBox.addAll(featuredBooks);
    return featuredBooks;
  }

  @override
  Future<List<BookEntity>> fetchRemoteNewestBooks() async {
    List<BookEntity> newestBooks = [];
    var res = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    for (var e in res['items']) {
      newestBooks.add(BookModel.fromJson(e));
    }
    var booksBox = Hive.box<BookEntity>('newestBooks');
    await booksBox.addAll(newestBooks);
    return newestBooks;
  }

  @override
  Future<Either<Failure, List<BookModel>>> getSimilarBooks(
      String category) async {
    try {
      var res = await apiService.get(
          endPoint:
              'volumes?q=subject:$category&Filtering=free-ebooks&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in res['items']) {
        books.add(BookModel.fromJson(item));
      }
      var booksBox = Hive.box<BookEntity>('similarBooks');
      await booksBox.addAll(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getSearchBooks(String title) async {
    try {
      var res = await apiService.get(
          endPoint: 'volumes?q=subject:$title&Filtering=free-ebooks');
      List<BookModel> books = [];
      for (var item in res['items']) {
        books.add(BookModel.fromJson(item));
      }
      var booksBox = Hive.box<BookEntity>('searchedBooks');
      await booksBox.addAll(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
