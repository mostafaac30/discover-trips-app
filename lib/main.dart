import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_logics.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/pages/details_page.dart';
import 'package:flutter_cubit/pages/nav_pages/main_page.dart';

import 'cubit/cubit.dart';
import 'shared/dio_helper.dart';

void main() {
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: IconThemeData(
          color: AppColors.bigTextColor,
        ),
      ),

      ///
      ///inject cubit / create
      ///
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(),

        ///
        /// child that check states / access
        child: AppCubitLogics(),
      ),
    );
  }
}
