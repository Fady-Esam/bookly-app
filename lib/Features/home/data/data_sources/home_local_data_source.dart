import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchLocalFeaturedBooks({int pageIndex = 0});
  List<BookEntity> fetchLocalNewestBooks();
  List<BookEntity> fetchLocalSimilarBooks();
  List<BookEntity> fetchLocalSearchedBooks();
}
