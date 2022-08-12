import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato/src/pages/homePage.dart';
import 'package:zomato/src/pages/mapsPage.dart';
import 'package:zomato/src/pages/orderPage.dart';
import 'package:zomato/src/pages/profilePage.dart';

class MainScreen extends StatefulWidget
{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex =0;
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  MapsPage mapsPage;
  ProfilePage profilePage;

  @override
  void initState() {
    super.initState();
    homePage=HomePage();
    orderPage=OrderPage();
    mapsPage=MapsPage();
    profilePage=ProfilePage();
    pages=[homePage,orderPage,mapsPage,profilePage];
    currentPage=homePage;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index)
        {
          setState(() {
            currentIndex=index;
            currentPage=pages[index];
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: ("home"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.shopping_cart),
            label: ("Order"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.zoom_out_map),
            label: ("Maps"),
            ),
            BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: ("Profile"),
            ),

        ],
      ),
      body: currentPage,
    );
  }
}