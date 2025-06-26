import 'package:flutter/material.dart';
import 'package:new_bookly_app/core/widgets/custom_fading_widget.dart';

class FeaturedBooksListViewLoadingIndcator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndcator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomBookWidgetLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class CustomBookWidgetLoadingIndicator extends StatelessWidget {
  const CustomBookWidgetLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3 / 2,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
