import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly_app/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:new_bookly_app/Features/home/presentation/manager/featured_books/featured_books_state.dart';
import 'custom_book_item.dart';

class CustomBooksListView extends StatefulWidget {
  const CustomBooksListView({super.key});

  @override
  State<CustomBooksListView> createState() => _CustomBooksListViewState();
}

class _CustomBooksListViewState extends State<CustomBooksListView> {

  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  Future<void> fetchBooks() async {
    await BlocProvider.of<FeaturedBooksCubit>(context)
        .fetchFeaturedBooks(pageIndex: nextPage++);
  }

  Future<void> scrollListener() async {
    double currentPosition = scrollController.position.pixels;
    double maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await fetchBooks();
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
          if (state is FeaturedBooksSuccessState) {
            books.addAll(state.featuredBooks);
          } else if (state is FeaturedBooksPaginationFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FeaturedBooksSuccessState ||
              state is FeaturedBooksPaginationLoadingState ||
              state is FeaturedBooksPaginationFailureState) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => GoRouter.of(context).push('/bookDetailsView'),
                  child: CustomBookItem(bookEntity: books[index]),
                );
              },
            );
          } else if (state is FeaturedBooksFailureState) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


