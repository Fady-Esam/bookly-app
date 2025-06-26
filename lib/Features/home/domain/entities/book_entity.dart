import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final String? previewLink;
  @HiveField(5)
  final String? authorName;
  @HiveField(6)
  final num? price;
  @HiveField(7)
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.category,
    required this.previewLink,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
