import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/large_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  List<String> images = [
    "welcome-one.png",
    "welcome-three.png",
    "welcome-four.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        duration: Duration(milliseconds: 300),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.only(top: 150, left: 20, bottom: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'img/' + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LargeAppText(text: "Trips"),
                      Spacer(),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: EdgeInsets.only(right: 20, bottom: 3),
                            width: 8,
                            height: indexDots == index ? 25 : 8,
                            decoration: BoxDecoration(
                                color: indexDots == index
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(100)),
                          );
                        }),
                      )
                    ],
                  ),
                  const AppText(text: "Mountain"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    child: AppText(
                      fontSize: 13,
                      color: AppColors.textColor2,
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ...",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      /// create an object of Cubit
                      BlocProvider.of<AppCubit>(context).getData();
                    },

                    /// Error Incorrect use of ParentDataWidget.
                    /// wrap Flexible (which is in ResponsiveButton)
                    ///  with a Row or Column
                    child: Row(
                      children: [
                        ResponsiveButton(
                          width: 120.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
