import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchLocalFeaturedBooks({int pageIndex = 0}) {
    int startIndex = pageIndex * 10;
    int endIndex = 10 * (pageIndex + 1);
    var booksBox = Hive.box<BookEntity>('featuredBooks');
    int length = booksBox.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return booksBox.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchLocalNewestBooks() {
    var booksBox = Hive.box<BookEntity>('newestBooks');
    return booksBox.values.toList();
  }
  @override
  List<BookEntity> fetchLocalSimilarBooks() {
    var booksBox = Hive.box<BookEntity>('similarBooks');
    return booksBox.values.toList();
  }
  @override
  List<BookEntity> fetchLocalSearchedBooks() {
    var booksBox = Hive.box<BookEntity>('searchedBooks');
    return booksBox.values.toList();
  }
}
