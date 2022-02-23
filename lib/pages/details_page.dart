import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/large_text.dart';
import 'package:flutter_cubit/widgets/location.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';
import 'package:flutter_cubit/widgets/select_button.dart';

import '../cubit/cubit.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //selected people
  int selectedPeople = -1;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // stars count
    int starsRate = 4;

    //
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      ///
      /// "as" parse it to DetailsState >> assign it
      ///
      DetailsState detailsState = state as DetailsState;
      AppCubit cubit = BlocProvider.of<AppCubit>(context);

      return Scaffold(
        body: BounceInDown(
          duration: Duration(milliseconds: 250),
          child: SizedBox(
              width: double.infinity,
              //stack widget should have width and height from Parent Widget
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: //menu and image
                        Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detailsState.place.img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: //menu and image
                        GestureDetector(
                      onTap: (() {
                        ///can be used without BlocBuilder()
                        BlocProvider.of<AppCubit>(context).goHome();
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset("img/menu.png", height: 30),
                          Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: AppColors.buttonBackground,
                          ),
                          // Container(
                          //   width: 40,
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Color.fromARGB(255, 7, 40, 40),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 315,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 310,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LargeAppText(
                                  text: detailsState.place.name,
                                  color: Colors.black87,
                                ),
                                LargeAppText(
                                  text: "\$ " +
                                      detailsState.place.price.toString(),
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // Location(location: detailsState.place.location),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                  size: 18,
                                ),
                                AppText(
                                  text: detailsState.place.location,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // horizontal space between elements aligned to start
                            //حاجة جاهزة للنجوم واخده هيكل النجوم
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star_rate,
                                      color: index < detailsState.place.stars
                                          ? AppColors.starColor
                                          : Colors.black26,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                    text:
                                        "(${detailsState.place.stars.toDouble()})"),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            LargeAppText(
                              text: "People",
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                            AppText(
                              text: "Number Of People In Your Group",
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              spacing: 10,
                              children: List.generate(
                                5,
                                (index) => InkWell(
                                  onTap: () {
                                    selectedPeople = index;
                                    setState(() {});
                                  },
                                  child: SelectButton(
                                    bgColor: index == selectedPeople
                                        ? Colors.white
                                        : Colors.black87,
                                    border: Border.all(
                                      color: AppColors.buttonBackground,
                                      width: 1.0,
                                    ),
                                    color: index == selectedPeople
                                        ? Colors.black87
                                        : AppColors.buttonBackground,
                                    size: 60,
                                    text: "${index + 1}",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            LargeAppText(
                              text: "Description",
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            AppText(
                              color: AppColors.mainTextColor,
                              fontSize: 16,
                              text: detailsState.place.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      // top: MediaQuery.of(context).size.height - 60,
                      bottom: 25, //instead of padding
                      right: 25,
                      left: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              cubit.makeFavorite(detailsState.place);
                              setState(() {});
                            },
                            child: SelectButton(
                              color: AppColors.buttonBackground,
                              bgColor: Colors.black87,
                              size: 60,
                              border: Border.all(
                                color: detailsState.place.isFav
                                    ? Colors.redAccent
                                    : AppColors.textColor1,
                              ),
                              icon: detailsState.place.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              iconColor:
                                  detailsState.place.isFav ? Colors.red : null,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("object");
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'New Trip Booked',
                                desc: 'Thanks for using our service',
                              )..show();
                            },
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 130,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    isResponsive: true,
                                    text: "Book Trip Now",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
        ),
      );
    });
  }
}
