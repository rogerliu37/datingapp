import 'package:demo3rdwheelhp/resources/firebase_repository.dart';
import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../matchTabSubPage1.dart';
import '../models/restaurant.dart';
import '../models/user.dart';

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
            child: buildNewsTab(),
          ),
        ));
  }
}

//buildNewsTab()
class buildNewsTab extends StatefulWidget {
  @override
  _buildNewsTabState createState() => _buildNewsTabState();
}

class _buildNewsTabState extends State<buildNewsTab> {
  //TODO figure out how to get restaurant data from data base
  List<Restaurant> restaurantList(BuildContext context) {
    return [
      Restaurant(assetName: "images/brewedL.jpg", title: "Brewed Leaf"),
      Restaurant(assetName: "images/chatime.jpg", title: "Chatime"),
      Restaurant(assetName: "images/kftStore.jpeg", title: "Kung Fu Tea"),
      Restaurant(assetName: "images/mmt.jpeg", title: "Millions of Milktea"),
      Restaurant(assetName: "images/vivi.jpg", title: "Vivi"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: restaurantList(context).map<Widget>((restaurants) {
          return restaurantView(
            restaurants: restaurants,
          );
        }).toList(),
      ),
    );
  }
}

//Text box
class restaurantData extends StatelessWidget {
  const restaurantData(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class restaurantView extends StatelessWidget {
  restaurantView({Key key, @required this.restaurants}) : super(key: key);
  final Restaurant restaurants;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: restaurantData(restaurants.title),
        ),
      ),
      child: Image.asset(restaurants.assetName),
    );
  }
}

//TODO Delete this after
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
