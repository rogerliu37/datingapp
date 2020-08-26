import 'package:demo3rdwheelhp/provider/user_provider.dart';
import 'package:demo3rdwheelhp/resources/auth_methods.dart';
import 'package:demo3rdwheelhp/resources/firebase_repository.dart';
import 'package:demo3rdwheelhp/screens/home_screen.dart';
import 'package:demo3rdwheelhp/screens/login_screen.dart';
import 'package:demo3rdwheelhp/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //Note * Changed to without new - TODO see if any error happens in future!
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseRepository _repository = FirebaseRepository();
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: "3rd Wheel",
        debugShowMaterialGrid: false,
        initialRoute: "/", //This main.dart is our first page
        routes: {
          '/search_screen': (context) => searchScreen(),
        },
        home: FutureBuilder(
          future: _authMethods.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
