import 'package:flutter/material.dart';

class homeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Image.asset('images/mainLogo.PNG',
              fit: BoxFit.cover, height: 150.0),
          backgroundColor: Colors.amber[200],
        ),
        backgroundColor: Colors.redAccent[700],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background1.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Text("This is a homepage"),
          ),
        ));
  }
}
