import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/pages/nav_pages/bar_item_page.dart';
import 'package:flutter_cubit/pages/nav_pages/home_page.dart';
import 'package:flutter_cubit/pages/nav_pages/my_page.dart';
import 'package:flutter_cubit/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTapNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

// Layout Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white, //work with fixed type
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black26,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTapNavBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: "Bar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My",
          ),
        ],
      ),
    );
  }
}
