import 'package:flutter/material.dart';
import 'matchTabSubPage1.dart';

class forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.redAccent[700],
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background2.JPG'),
                      fit: BoxFit.cover)),
              child: MyStatefulWidget()),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
