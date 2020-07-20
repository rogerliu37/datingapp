import 'package:flutter/material.dart';

class dateTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.redAccent[700],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background1.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Text("This is the date page"),
          ),
        ));
  }
}
