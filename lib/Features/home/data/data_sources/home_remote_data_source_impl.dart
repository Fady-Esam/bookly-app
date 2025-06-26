import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_bookly_app/Features/home/data/models/book_model/book_model.dart';

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
}
