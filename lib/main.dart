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
    final tabController = new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          title: Image.asset('images/mainLogo.PNG',
              fit: BoxFit.cover, height: 150.0),
          backgroundColor: Colors.teal[200],
        ),

        //Converted BottomTabBar
        bottomNavigationBar: new TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[350],
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            tabs: [
              new Tab(icon: new Icon(Icons.home)),
              new Tab(icon: new Icon(Icons.wc)),
              new Tab(icon: new Icon(Icons.local_cafe)),
              new Tab(icon: new Icon(Icons.person_pin)),
            ]),
        backgroundColor: Colors.grey[850],
        body: new TabBarView(
          children: [
            new homeTab(),
            new matchTab(),
            new dateTab(),
            new contactTab(),
          ],
        ),
      ),
    );

    return new MaterialApp(title: "3rd Wheel", home: tabController);
  }
}
