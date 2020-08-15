import 'package:demo3rdwheelhp/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class dateTab extends StatefulWidget {
  @override
  _dateTabState createState() => _dateTabState();
}

class _dateTabState extends State<dateTab> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double dateViewListHeight = size.height * 0.30;
    //TODO Fix so that the height is not fixed but rather flexible
    return Scaffold(
        appBar: new AppBar(
          title: Image.asset('images/mainLogo.PNG',
              fit: BoxFit.cover, height: 150.0),
          backgroundColor: Colors.amber[200],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background1.png'),
                  fit: BoxFit.cover)),
          height: size.height,
          child: Column(
            //TODO Create ontaps for each one!
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              //Upcoming Date title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Upcoming Dates",
                      style: TextStyle(
                          color: UniversalVariables.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                ],
              ),
              //Single Date Card
              //TODO figure out flex for each one!
              Expanded(flex: 1, child: dateCards()),
              //Sized box and past dates
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Past Dates",
                      style: TextStyle(
                          color: UniversalVariables.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                ],
              ),
              Expanded(child: dateCardListView()),
            ],
          ),
        ));
  }
}

class dateCardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = currentDate.month.toString() +
        "/" +
        currentDate.day.toString() +
        "/" +
        currentDate.year.toString();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 235,
                      //TODO fix this so that its not a fixed height and width!
                      width: 200,
                      child: Card(
                        color: Colors.lightBlue[100],
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 235,
                      //TODO fix this so that its not a fixed height and width!
                      width: 200,
                      child: Card(
                        color: Colors.lightBlue[100],
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 235,
                      //TODO fix this so that its not a fixed height and width!
                      width: 200,
                      child: Card(
                        color: Colors.lightBlue[100],
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 235,
                      //TODO fix this so that its not a fixed height and width!
                      width: 200,
                      child: Card(
                        color: Colors.lightBlue[100],
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO use something like this in the future
//Row(
//children: <Widget>[
//Expanded(
//child: SizedBox(
//height: 50.0,
//child: new ListView.builder(
//scrollDirection: Axis.horizontal,
//itemCount: scoreKeeper.length,
//itemBuilder: (BuildContext ctxt, int Index) {
//return scoreKeeper[Index];
//}),
//),
//),
//],
//),

/*
Separate class to create date cards
 */

class dateCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = currentDate.month.toString() +
        "/" +
        currentDate.day.toString() +
        "/" +
        currentDate.year.toString();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      //padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 235,
                child: Card(
                  color: Colors.lightBlue[100],
                  // This ensures that the Card's children (including the ink splash) are clipped correctly.
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        formattedDate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
