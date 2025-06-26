import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => GoRouter.of(context).push('/pressedView'),
            child:  Text(''),
          );
        },
      ),
    );
  }
}
