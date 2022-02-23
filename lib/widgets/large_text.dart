import 'package:flutter/material.dart';

class LargeAppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const LargeAppText({
    Key? key,
    required this.text,
    this.fontSize = 30,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
