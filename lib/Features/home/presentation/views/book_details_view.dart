import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';

import '../manager/similar_books_cubit/similar_books_cubit.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookEntity});
final BookEntity bookEntity;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      widget.bookEntity.category ?? 'programming',
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDtailsViewBody(bookEntity: widget.bookEntity),
    );
  }
}
