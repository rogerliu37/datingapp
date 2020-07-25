import 'package:flutter/material.dart';

class profileTab extends StatefulWidget {
  @override
  _profile createState() => _profile();
}

class _profile extends State<profileTab> {
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
            onPressed: () => _onButtonPressed(),
          ),
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //Circle Profile + Connections
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/Logo.PNG'),
                      ),
                      Flexible(
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
                  //Personal Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text
                      Center(
                        child: Flexible(
                          child: Text("Personal Details",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 23.0,
                                color: Colors.teal[100],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                  //Space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                  //Card for Orientation
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.wc,
                        color: Colors.teal,
                      ),
                      title: Text('Orientation: Straight',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  //Ethnicity
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Colors.teal,
                      ),
                      title: Text('Ethnicity: Asian',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  //Myer-Briggs
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.face,
                        color: Colors.teal,
                      ),
                      title: Text('Myer Briggs: INTJ-A',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  //Dating Preferences
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text
                      Center(
                        child: Flexible(
                          child: Text("Dating Preferences",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 23.0,
                                color: Colors.teal[100],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                  //Space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                  //Age Range
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Colors.teal,
                      ),
                      title: Text('Age Range: 18-22',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  //Ethnicity
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.flag,
                        color: Colors.teal,
                      ),
                      title: Text('Ethnicity: Open to all',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  //Free Time Activities
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text
                      Center(
                        child: Flexible(
                          child: Text("Free Time Activities",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 23.0,
                                color: Colors.teal[100],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                  //Just Random stuff
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        color: Colors.teal,
                      ),
                      title: Text('User Input here',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        color: Colors.teal,
                      ),
                      title: Text('User Input Here',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        color: Colors.teal,
                      ),
                      title: Text('User Input here',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        color: Colors.teal,
                      ),
                      title: Text('User Input Here',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0)),
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

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.black87,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.teal,
                  ),
                  title: Text('Delete Account',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0)),
                )
              ],
            ),
          );
        });
  }
}
