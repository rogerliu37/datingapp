import 'package:demo3rdwheelhp/resources/firebase_repository.dart';
import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'matchTabSubPage1.dart';
import 'models/user.dart';

class newsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Image.asset('images/mainLogo.PNG',
              fit: BoxFit.cover, height: 150.0),
          backgroundColor: Colors.amber[200],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        backgroundColor: Colors.grey[850],
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background2.JPG'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Text(
                  'News Feed or Explore Page: Get them thinking about date ideas'),
            ),
          ),
        ));
  }
}

//buildNewsTab()
class buildNewsTab extends StatefulWidget {
  buildNewsTab({Key key}) : super(key: key);

  @override
  _buildNewsTabState createState() => _buildNewsTabState();
}

class _buildNewsTabState extends State<buildNewsTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //First Name
          Flexible(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.sentiment_dissatisfied),
                  hintText: 'How ya feeling?',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          //Last Name
          Flexible(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.sentiment_neutral),
                  hintText: 'Neutral',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          //Email
          Flexible(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.sentiment_satisfied),
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          //Phone Number
          Flexible(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Phone number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          //Date of Birth
          Flexible(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.cake),
                  hintText: 'Date of Birth',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          //Submit button (First Page of form)
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                  //Goes to next subpage
                  navigateToSubPage1(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

Future navigateToSubPage1(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MatchTabSubPage1()));
}

/*
SearchDelegate - Try to implement a different way of searching while also
maintaining the future feature of having a grid view of things to do.
 */
class DataSearch extends SearchDelegate<String> {
  //TODO Create a recent list and change algo in build suggestions
  FirebaseRepository _repository = FirebaseRepository();
  List<User> userList;

  void getUserData() {
    _repository.getCurrentUser().then((FirebaseUser user) {
      _repository.fetchAllUsers(user).then((List<User> list) {
        userList = list;
      });
    });
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Leading icon on the left the app bar
    return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    //Show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Show when someone searches for something
    getUserData();
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

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        User searchedUser = User(
          uid: suggestionList[index].uid,
          profilePhoto: suggestionList[index].profilePhoto,
          name: suggestionList[index].name,
          username: suggestionList[index].username,
        );
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.profilePhoto),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
}
