import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'app_text.dart';

class SelectButton extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final double size;
  final Border? border;
  final IconData? icon;
  final Color? iconColor;
  final String? text;
  const SelectButton({
    Key? key,
    required this.color,
    required this.bgColor,
    required this.size,
    this.border,
    this.text,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: border,
      ),
      child: Center(
        child: text != null
            ? AppText(
                text: "$text",
                color: bgColor,
              )
            : Icon(
                icon,
                color: iconColor,
              ),
      ),
    );
  }
}
