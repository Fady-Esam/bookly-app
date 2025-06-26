import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchRemoteFeaturedBooks({int pageIndex = 0});
  Future<List<BookEntity>> fetchRemoteNewestBooks();
}
