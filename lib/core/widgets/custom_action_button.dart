import 'package:flutter/material.dart';

import 'custom_action_button_item.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton(
      {super.key, required this.onTap});

  final void Function() onTap;
  // final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomActionButtonItem(
          bottomLeft: 16,
          topLeft: 16,
          containerColor: Colors.white,
          text: 'Free',
          fontSize: 21,
          fontWeight: FontWeight.w900,
          textColor: Colors.black,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomActionButtonItem(
            bottomRight: 16,
            topRight: 16,
            containerColor: const Color(0xffEf8262),
            text: 'Prview',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}

// String getText(BookModel model) {
//   if (model.volumeInfo!.imageLinks == null) {
//     return 'Not Available';
//   } else {
//     return 'Available';
//   }
// }
