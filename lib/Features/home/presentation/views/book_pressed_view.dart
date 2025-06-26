import 'package:flutter/material.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';

import 'book_pressed_view_body.dart';

class BookPressedView extends StatelessWidget {
  const BookPressedView({super.key, required this.bookEntity});

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookPressedViewBody(bookEntity : bookEntity),
    );
  }
}
