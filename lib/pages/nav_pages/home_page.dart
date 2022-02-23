import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/cubit.dart';
import 'package:flutter_cubit/cubit/states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/large_text.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../widgets/app_text.dart';
import '../../widgets/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    //this for this context
    //TickerProviderStateMixin

    Map<String, String> smallImage = {
      'balloning.png': 'balloning',
      'hiking.png': 'hiking',
      'snorkling.png': 'snorkling',
      'kayaking.png': 'kayaking'
    };

    return BlocBuilder<AppCubit, AppStates>(
      builder: ((context, state) {
        if (state is LoadedSuccessfullyState) {
          ///
          ///3. access grabbed data in UI
          ///
          final places = state.places;
          return SafeArea(
            bottom: false,
            child: SliderDrawer(
              animationDuration: 250,
              slideDirection: SlideDirection.TOP_TO_BOTTOM,
              slider: Container(
                margin: EdgeInsets.only(
                  top: 265 / 2,
                ),
                child: Center(
                  child: LargeAppText(
                    text: "Welcome To Discover app",
                    fontSize: 25,
                  ),
                ),
              ),
              appBar: SliderAppBar(
                title: Text(""),
                appBarPadding: EdgeInsets.only(top: 0.0, left: 20, right: 20),
                drawerIconSize: 35,
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 7, 40, 40),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://media-exp1.licdn.com/dms/image/C5603AQHr5VlPbeow4A/profile-displayphoto-shrink_800_800/0/1639332121692?e=1651104000&v=beta&t=_QKZzIEisTQUd8lzcMj-q03xqL4kYO1TTIuy-w_5_Wo"),
                    ),
                  ),
                ),
              ),
              child: BounceInUp(
                duration: Duration(
                  milliseconds: 250,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //menu and image
                    // Container(
                    //   margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
                    //   height: 40,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       // Image.asset("img/menu.png", height: 30),
                    //       // Container(
                    //       //   width: 40,
                    //       //   height: 40,
                    //       //   decoration: BoxDecoration(
                    //       //     borderRadius: BorderRadius.circular(10),
                    //       //     color: const Color.fromARGB(255, 7, 40, 40),
                    //       //   ),
                    //       // )
                    //     ],
                    //   ),
                    // ),

                    // const SizedBox(
                    //   height: 40,
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: LargeAppText(
                        text: "Discover",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                        height: 40,
                        child: TabBar(
                          labelColor: AppColors.bigTextColor,
                          unselectedLabelColor: Colors.grey,
                          controller: _tabController,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: IndicatorCircle(
                              color: AppColors.mainColor, radius: 4),
                          tabs: [
                            Tab(
                              child: Text("Places"),
                            ),
                            Tab(
                              child: Text("Inspiration"),
                            ),
                            Tab(
                              child: Text("Emotions"),
                            ),
                          ],
                        )),
                    SizedBox(
                        height: 320,
                        // width: double.infinity,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AppCubit>(context)
                                        .getDetails(places[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 25),
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              places[index].img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: places[index].name,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: AppColors.mainColor,
                                                size: 18,
                                              ),
                                              AppText(
                                                text: places[index]
                                                    .location
                                                    .split(RegExp(r' '))[0],
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            ///tab 2
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AppCubit>(context)
                                        .getDetails(places[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 25),
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          ///reverse images
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              places[places.length - 1 - index]
                                                  .img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            ///tab 3
                            ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AppCubit>(context)
                                        .getDetails(places[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 25),
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              places[index].img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            // Text("New"),
                            // Text("Top Rated"),
                          ],
                        )),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeAppText(
                            text: "Explore more",
                            fontSize: 22,
                          ),
                          AppText(
                            text: "See all",
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 120,
                        width: double.maxFinite,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: smallImage.length,
                          itemBuilder: (_, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("img/" +
                                          smallImage.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                AppText(
                                  text: "${smallImage.values.elementAt(index)}",
                                  fontSize: 18,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(width: 20),
                        ),
                      ),
                    )

                    //
                  ],
                ),
              ),
            ),
          );
        } else
          return Container();
      }),
    );
  }
}

class IndicatorCircle extends Decoration {
  final color;
  final double radius;

  IndicatorCircle({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circle(color: color, radius: radius);
  }
}

class _circle extends BoxPainter {
  final color;
  final double radius;

  _circle({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint

    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final _circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + _circleOffset, radius, _paint);
    // offset is 0,0 topLeft
    // circleOffset add a values x and y to/starting from the origin (0,0)
    //offset + _circleOffset
  }
}
