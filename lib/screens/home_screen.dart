import 'package:demo3rdwheelhp/tabs/dateTab.dart';
import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo3rdwheelhp/resources/firebase_repository.dart';
import 'package:demo3rdwheelhp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo3rdwheelhp/tabs/homeTab.dart';
import 'package:demo3rdwheelhp/tabs/newsTab.dart';
import 'package:demo3rdwheelhp/profileTab.dart';
import 'package:demo3rdwheelhp/tabs/createTab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  //TODO Convert this to a separate HomeScreen() file - for simplicity
  final List<Widget> _children = [
    new HomeTab(),
    new newsTab(),
    new createTab(),
    new dateTab(),
    new profileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      //Converted BottomTabBar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            title: new Text(""),
            icon: new Icon(Icons.home, color: Colors.grey),
            activeIcon: new Icon(Icons.home, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: new Text(""),
            icon: new Icon(Icons.assignment, color: Colors.grey),
            activeIcon: new Icon(Icons.assignment, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: new Text(""),
            icon: new Icon(Icons.add_box, color: Colors.grey),
            activeIcon: new Icon(Icons.add_box, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: new Text(""),
            icon: new Icon(Icons.calendar_today, color: Colors.grey),
            activeIcon: new Icon(Icons.calendar_today, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: new Text(""),
            icon: new Icon(Icons.person, color: Colors.grey),
            activeIcon: new Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
