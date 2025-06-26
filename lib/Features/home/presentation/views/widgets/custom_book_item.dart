import 'package:flutter/material.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3 / 2,
      child: bookEntity.image != null
          ? CachedNetworkImage(
              imageUrl: bookEntity.image!,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Center(
                child: Text(
                  'Failed to load',
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}


