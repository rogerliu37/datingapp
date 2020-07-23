import 'package:flutter/material.dart';
import 'homeTab.dart';
import 'dateTab.dart';
import 'matchTab.dart';
import 'contactTab.dart';

void main() {
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "3rd Wheel",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new homeTab(),
    new matchTab(),
    new matchTab(),
    new dateTab(),
    new contactTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Image.asset('images/mainLogo.PNG',
            fit: BoxFit.cover, height: 150.0),
        backgroundColor: Colors.teal[200],
      ),
      body: _children[_currentIndex],
      //Converted BottomTabBar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
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
