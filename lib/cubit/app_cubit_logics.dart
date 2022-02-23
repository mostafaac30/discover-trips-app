import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/cubit/states.dart';
import 'package:flutter_cubit/pages/details_page.dart';
import 'package:flutter_cubit/pages/nav_pages/main_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

////
/// this Logics controls flow of app
///
class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    ///
    return

        ///
        ///blocBuilder checks the states or / consume like BlocConsumer
        ///generic AppCubit and AppStates
        BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is InitialState) return WelcomePage();
        if (state is DetailsState) return DetailsPage();
        // if (state is FavoriteState) return DetailsPage();
        if (state is LoadingState)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          );
        if (state is LoadedSuccessfullyState)
          return MainPage();
        else
          return Container();
      },
    );
  }
}
