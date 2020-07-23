import 'package:flutter/material.dart';

class profileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: new AppBar(
        title: Text(
          "Tyler Liu",
          style: TextStyle(
            color: Colors.grey[850],
            fontFamily: 'Pacifico',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[200],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.dehaze),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background2.JPG'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                                        color: Colors.white,
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
      ),
    );
  }
}
