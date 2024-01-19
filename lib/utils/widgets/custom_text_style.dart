import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle(
      {super.key,
      required this.content,
      required this.size,
      this.weight,
      required this.color, this.height});
  final String content;
  final double size;
  final FontWeight? weight;
  final Color color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height
      ),
    );
  }
}
