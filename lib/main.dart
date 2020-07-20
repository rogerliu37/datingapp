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
          bottom: new TabBar(
              indicatorColor: Colors.amberAccent,
              indicatorWeight: 5.0,
              tabs: [
                new Tab(icon: new Icon(Icons.home), text: "Home"),
                new Tab(icon: new Icon(Icons.wc), text: "Match"),
                new Tab(icon: new Icon(Icons.local_cafe), text: "Dates"),
                new Tab(icon: new Icon(Icons.person_pin), text: "Profile"),
              ]),
        ),
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
    return new MaterialApp(title: "Tabs Example", home: tabController);
  }
}
