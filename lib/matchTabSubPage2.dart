import 'package:flutter/material.dart';

/*
  Bool values for checkListTiles
 */
bool _checked = false;
bool _checked1 = false;
bool _checked2 = false;
bool _checked3 = false;
bool _checked4 = false;
bool _checked5 = false;
bool _checked6 = false;
bool _checked7 = false;
bool _checked8 = false;
bool _checked9 = false;
bool _checked10 = false;
bool _checked11 = false;

class MatchTabSubPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.redAccent[700],
        appBar: new AppBar(
          title: Image.asset('images/mainLogo.PNG',
              fit: BoxFit.cover, height: 150.0),
          backgroundColor: Colors.amberAccent[200],
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background1.png'),
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
          CheckboxListTile(
            title: Text("18-22 (Only For Beta)"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked,
            onChanged: (bool value) {
              setState(() {
                _checked = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Open to all"),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked1,
            onChanged: (bool value) {
              setState(() {
                _checked1 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("White/Caucasian"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked2,
            onChanged: (bool value) {
              setState(() {
                _checked2 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Black/African American Descent"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked3,
            onChanged: (bool value) {
              setState(() {
                _checked3 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Hispanic/Latino"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked4,
            onChanged: (bool value) {
              setState(() {
                _checked4 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("East Asian"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked5,
            onChanged: (bool value) {
              setState(() {
                _checked5 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Southeast Asian"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked6,
            onChanged: (bool value) {
              setState(() {
                _checked6 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("South Asain"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked7,
            onChanged: (bool value) {
              setState(() {
                _checked7 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Central Asain"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked8,
            onChanged: (bool value) {
              setState(() {
                _checked8 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Middle Eastern"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked9,
            onChanged: (bool value) {
              setState(() {
                _checked9 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Native American"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked10,
            onChanged: (bool value) {
              setState(() {
                _checked10 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
          CheckboxListTile(
            title: Text("Pacific Islander"),
            secondary: Icon(Icons.date_range),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked11,
            onChanged: (bool value) {
              setState(() {
                _checked11 = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.black,
          ),
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
                  navigateToSubPage2(context);
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

Future navigateToSubPage2(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MatchTabSubPage2()));
}
