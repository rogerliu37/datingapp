import 'package:flutter/material.dart';

class profileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          "Tyler Liu",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Pacifico',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/Logo.PNG'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("7M",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey[50],
                                      fontWeight: FontWeight.bold,
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  child: Text("Connections",
                                      style: TextStyle(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 20.0,
                                        color: Colors.teal[100],
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.0,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          //Spacing between text
                          height: 20.0,
                          width: 150.0,
                          child: Divider(
                            color: Colors.teal.shade100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
