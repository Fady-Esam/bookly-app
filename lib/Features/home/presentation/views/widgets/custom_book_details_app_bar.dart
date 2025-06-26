import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(
            Icons.close,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 28),
          child: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ],
    );
  }
}
