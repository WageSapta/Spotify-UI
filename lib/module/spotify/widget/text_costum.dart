import 'package:flutter/material.dart';

class TextCostum extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final Color color;
  const TextCostum({
    Key? key,
    required this.text,
    this.size = 16,
    this.isBold = false,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
