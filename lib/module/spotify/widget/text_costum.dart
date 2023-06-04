import 'package:flutter/material.dart';

class TextCostum extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final Color color;
  final int maxLines;
  const TextCostum({
    Key? key,
    required this.text,
    this.size = 16,
    this.isBold = false,
    this.color = Colors.white,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
