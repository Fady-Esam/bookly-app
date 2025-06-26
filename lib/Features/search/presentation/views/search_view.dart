import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/cubit/search_books_cubit.dart';
import '../manager/cubit/search_books_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 18),
            TextField(
              onChanged: (value) {
                BlocProvider.of<SearchBooksCubit>(context)
                    .fetchSearchBooks(value);
              },
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: 'search',
                labelText: 'BookName',
              ),
            ),
            const SizedBox(height: 32),
            const Expanded(child: SearchViewList()),
          ],
        ),
      ),
    );
  }
}

class SearchViewList extends StatelessWidget {
  const SearchViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => GoRouter.of(context)
                    .push('/bookDetailsView', extra: state.books[index]),
                child: CustomBookSearchItem(
                  image: state.books[index].image ?? 
                      '',
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return Center(
            child: state.errMessage.contains('Null')
                ? const Text(
                    'Cannot find a search book',
                    textAlign: TextAlign.center,
                  )
                : Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                  ),
          );
        } else if (state is SearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No items yet'));
        }
      },
    );
  }
}

class CustomBookSearchItem extends StatelessWidget {
  const CustomBookSearchItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 240,
      child: AspectRatio(
        aspectRatio: 1.3 / 2,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
          imageUrl: image,
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
