import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../manager/similar_books_cubit/similar_books_cubit.dart';
import '../../manager/similar_books_cubit/similar_books_state.dart';
import 'custom_book_item.dart';


class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => GoRouter.of(context)
                      .push('/pressedView', extra: state.books[index]),
                  child: CustomBookItem(
                    bookEntity: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
