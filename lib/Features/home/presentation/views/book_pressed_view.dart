import 'package:flutter/material.dart';

import 'book_pressed_view_body.dart';

class BookPressedView extends StatelessWidget {
  const BookPressedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookPressedViewBody(),
    );
  }
}
