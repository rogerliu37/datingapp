import 'package:demo3rdwheelhp/screens/login_screen.dart';
import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:demo3rdwheelhp/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo3rdwheelhp/resources/firebase_repository.dart';

class profileTab extends StatefulWidget {
  @override
  _profile createState() => _profile();
}

class _profile extends State<profileTab> {
  FirebaseRepository _repository = FirebaseRepository();

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
      ),
      body: Container(
        color: Colors.grey[850],
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
                  //Account Settings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text
                      Center(
                        child: Flexible(
                          child: Text("Account Settings",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 25.0,
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
                  Column(
                    children: <Widget>[
                      //Delete Account
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          title: Text('Personal Information',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                        //alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //Location On
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.location_on,
                            color: Colors.teal,
                          ),
                          title: Text('Location Settings',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //UserName Change
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.teal,
                          ),
                          title: Text('Username Change',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //Preference Change
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.chat,
                            color: Colors.teal,
                          ),
                          title: Text('Preference Change',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //Credit Card Info Change
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.credit_card,
                            color: Colors.teal,
                          ),
                          title: Text('Change Payment',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //Notification
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.notifications_active,
                            color: Colors.teal,
                          ),
                          title: Text('Notifications',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      //Spacing between text
                      height: 20,
                      child: Container()),
                  //Support
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text
                      Center(
                        child: Flexible(
                          child: Text("Support",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 25.0,
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
                  Column(
                    children: <Widget>[
                      //Help
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.help,
                            color: Colors.teal,
                          ),
                          title: Text('Help',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      //About
                      Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.question_answer,
                            color: Colors.teal,
                          ),
                          title: Text('About',
                              style: TextStyle(
                                  color: Colors.teal.shade500,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 23.0)),
                          onTap: () {},
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      SizedBox(
                        //Spacing between text
                        height: 0,
                        width: 340.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      //Spacing between text
                      height: 20,
                      child: Container()),
                  //Logout
                  Container(
                    child: ListTile(
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.teal.shade500,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => signOut(),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 150),
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
    Signs user out and prevents them from entering back (protecting data)
   */
  signOut() async {
    final bool isLoggedOut = await _repository.signOut();
    if (isLoggedOut) {
      //Navigate the user to the login screen
      //Such that he is not able to back by tapping the back button

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  //TODO: Implement all the navigation when each tile is pressed
  void _navigatePage() {
    Navigator.pop(context);
  }
}
