import 'package:demo3rdwheelhp/resources/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:demo3rdwheelhp/models/user.dart';
import 'package:demo3rdwheelhp/resources/firebase_repository.dart';
import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:demo3rdwheelhp/widgets/custom_tile.dart';

import 'chat_screen.dart';

class searchScreen extends StatefulWidget {
  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  FirebaseRepository _repository = FirebaseRepository();
  final AuthMethods _authMethods = AuthMethods();

  List<User> userList;
  String query = "";

  //The controller that we pass to out test view
  TextEditingController searchController = TextEditingController();

  /*
  Query and place all users based on text into the list of users. This will
  allow for easier access of finding people/contacts and will not be network
  intensive. *Note may change (be more intensive) when scaled higher (more ppl)?
   */

  @override
  void initState() {
    super.initState();

    _authMethods.getCurrentUser().then((FirebaseUser user) {
      _authMethods.fetchAllUsers(user).then((List<User> list) {
        setState(() {
          userList = list;
        });
      });
    });
  }

  //Create a custom search appbar
  //Since we wont be resuing this anywhere else in the app, there is no need
  //To create it's own class.
  searchAppBar(BuildContext context) {
    //TODO Adjust all of this to fit the 3rd Wheel App
    return AppBar(
      backgroundColor: Colors.amberAccent[200],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      title: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight - 10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: searchController,
            //Receive value
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: UniversalVariables.blackColor,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              //TODO change this based on appearance of 3rd Wheel App
              fontSize: 20,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                //Clears the input
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*
  Constructs a list of users when searching
   */
  buildSuggestions(String query) {
    //Check if query is empty, if it is leave it empty, else show list of users searched
    /*
    Scan entire query until the text input matches (contains) whatever user
    entered into the text field. (Username or exact id)
     */
    final List<User> suggestionList = query.isEmpty
        ? []
        : userList.where((User user) {
            String _getUsername = user.username.toLowerCase();
            String _query = query.toLowerCase();
            String _getName = user.name.toLowerCase();
            bool matchesUsername = _getUsername.contains(_query);
            bool matchesName = _getName.contains(_query);

            return (matchesUsername || matchesName);
          }).toList();
    //This code is exactly same as above. More readable with one on top.
//            (user.username.toLowerCase().contains(query.toLowerCase()) ||
//                (user.name.toLowerCase().contains(query.toLowerCase()))));

    //TODO learn how to allow new users to set their usernames
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        User searchedUser = User(
          uid: suggestionList[index].uid,
          profilePhoto: suggestionList[index].profilePhoto,
          name: suggestionList[index].name,
          username: suggestionList[index].username,
        );
        return CustomTile(
          mini: false,
          //Push user to the chat screen
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: searchedUser,
                        )));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.profilePhoto),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            searchedUser.name,
            style: TextStyle(
              color: UniversalVariables.greyColor,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: searchAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: buildSuggestions(query),
      ),
    );
  }
}
