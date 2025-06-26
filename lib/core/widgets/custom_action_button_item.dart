import 'package:flutter/material.dart';

class CustomActionButtonItem extends StatelessWidget {
  const CustomActionButtonItem({
    super.key,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    this.topLeft = 0,
    this.topRight = 0,
    required this.containerColor,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
  });

  final double bottomLeft;
  final double bottomRight;
  final double topLeft;
  final double topRight;
  final Color containerColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.43,
      height: MediaQuery.sizeOf(context).width * 0.14,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
