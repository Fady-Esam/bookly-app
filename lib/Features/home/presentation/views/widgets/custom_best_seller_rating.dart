import 'package:flutter/material.dart';

class CutsomBestSellerRating extends StatelessWidget {
  const CutsomBestSellerRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(width: 6),
        const Text(
          '4.8 ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '(2390)',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
