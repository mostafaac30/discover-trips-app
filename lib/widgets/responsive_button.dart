import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final width;
  final text;
  bool isResponsive;
  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120.0,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //flexible>> his parent should have constrains width and height when it used
    return Flexible(
      child: Container(
        height: 60,
        width: isResponsive ? double.infinity : width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: AppText(
                      text: text,
                      color: Colors.white,
                    ),
                  )
                : Text(""),
            Image.asset(
              "img/button-one.png",
            ),
          ],
        ),
      ),
    );
  }
}
