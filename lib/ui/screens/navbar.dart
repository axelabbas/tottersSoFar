import 'package:flutter/material.dart';
import 'package:fulltoters/ui/screens/mainscreens/bulter.dart';
import 'package:fulltoters/ui/screens/mainscreens/home.dart';
import 'package:fulltoters/ui/screens/mainscreens/orders.dart';
import 'package:fulltoters/ui/screens/mainscreens/profile.dart';
import 'package:fulltoters/ui/screens/subscreens/restprofile.dart';
import 'package:fulltoters/ui/screens/mainscreens/search.dart';

class myNavbar extends StatefulWidget {
  const myNavbar({Key? key}) : super(key: key);

  @override
  State<myNavbar> createState() => _myNavbarState();
}

class _myNavbarState extends State<myNavbar> {
  int currentIndex = 0;
  List<Widget> pageList = [
    MyApp(), //0
    searchScreen(), //3
    butlerScreen(),
    HomePage(),
    profileScreen(), //5
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: pageList.elementAt(currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'butler'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
                color: Colors.black,
              ),
              label: 'orders'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
