import 'package:demo3rdwheelhp/provider/user_provider.dart';
import 'package:demo3rdwheelhp/resources/auth_methods.dart';
import 'package:demo3rdwheelhp/screens/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  _homeTab createState() => _homeTab();
}

class _homeTab extends State<HomeTab> with WidgetsBindingObserver {
  PageController pageController;
  int _page = 0;
  final AuthMethods _authMethods = AuthMethods();

  UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.refreshUser();
    });

    WidgetsBinding.instance.addObserver(this);

    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle =
        Theme.of(context).textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/mainLogo.PNG',
            fit: BoxFit.cover, height: 150.0),
        backgroundColor: Colors.amber[200],
        //Lead user to DM page for chatting, potentially video, etc.
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.textsms,
              color: Colors.white,
            ),
            onPressed: () => _onButtonPressed(),
          ),
        ],
      ),
      backgroundColor: Colors.grey[850],
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            /*
              This is Hardcoded
              TODO: Figure out a way to allow easy input & display
             */
            //Brewed Leaf
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338.0,
                      child: Card(
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Card was tapped');
                          },
                          // Generally, material cards use onSurface with 12% opacity for the pressed state.
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          // Generally, material cards do not have a highlight overlay.
                          highlightColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    184, //TODO Get number of pixels of device, then using that resize the box
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      // In order to have the ink splash appear above the image, you
                                      // must use Ink.image. This allows the image to be painted as
                                      // part of the Material and display ink effects above it. Using
                                      // a standard Image will obscure the ink splash.
                                      child: Ink.image(
                                        image: AssetImage('images/brewedL.jpg'),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'The Brewed Leaf',
                                          style: titleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Description and share/explore buttons.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // This array contains the three line description on each card
                                      // demo.
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text('Bubble Tea Restaurant',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Text('Phone: (614) 914-8821'),
                                      Text(
                                          'Address: 809 Bethel Rd, Columbus, OH 43214'),
                                      Text('Hours: 12-9PM'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Cha time
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338.0,
                      child: Card(
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Card was tapped');
                          },
                          // Generally, material cards use onSurface with 12% opacity for the pressed state.
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          // Generally, material cards do not have a highlight overlay.
                          highlightColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 184,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      // In order to have the ink splash appear above the image, you
                                      // must use Ink.image. This allows the image to be painted as
                                      // part of the Material and display ink effects above it. Using
                                      // a standard Image will obscure the ink splash.
                                      child: Ink.image(
                                        image: AssetImage('images/chatime.jpg'),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Chatime',
                                          style: titleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Description and share/explore buttons.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // This array contains the three line description on each card
                                      // demo.
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text('Bubble Tea Restaurant',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Text('Phone: 614) 914-8998'),
                                      Text(
                                          'Address: 2060 N High St, Columbus, OH 43201'),
                                      Text('Hours: 3-8PM'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //KFT
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338.0,
                      child: Card(
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Card was tapped');
                          },
                          // Generally, material cards use onSurface with 12% opacity for the pressed state.
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          // Generally, material cards do not have a highlight overlay.
                          highlightColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 184,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      // In order to have the ink splash appear above the image, you
                                      // must use Ink.image. This allows the image to be painted as
                                      // part of the Material and display ink effects above it. Using
                                      // a standard Image will obscure the ink splash.
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/kftStore.jpeg'),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Kung Fu Tea - Kenny Center',
                                          style: titleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Description and share/explore buttons.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // This array contains the three line description on each card
                                      // demo.
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text('Bubble Tea Restaurant',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Text('Phone: (614) 641-7595'),
                                      Text(
                                          'Address: 1161 Kenny Centre Mall, Columbus, OH 43220'),
                                      Text('Hours: 12-8PM'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //MMT
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338.0,
                      child: Card(
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Card was tapped');
                          },
                          // Generally, material cards use onSurface with 12% opacity for the pressed state.
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          // Generally, material cards do not have a highlight overlay.
                          highlightColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 184,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      // In order to have the ink splash appear above the image, you
                                      // must use Ink.image. This allows the image to be painted as
                                      // part of the Material and display ink effects above it. Using
                                      // a standard Image will obscure the ink splash.
                                      child: Ink.image(
                                        image: AssetImage('images/mmt.jpeg'),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Millions of Milk Tea',
                                          style: titleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Description and share/explore buttons.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // This array contains the three line description on each card
                                      // demo.
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text('Bubble Tea Restaurant',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Text('Phone: 614) 525-0030'),
                                      Text(
                                          'Address: 1990 N High St, Columbus, OH 43201'),
                                      Text('Hours: 10-10PM'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //vivi
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338.0,
                      child: Card(
                        // This ensures that the Card's children (including the ink splash) are clipped correctly.
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Card was tapped');
                          },
                          // Generally, material cards use onSurface with 12% opacity for the pressed state.
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          // Generally, material cards do not have a highlight overlay.
                          highlightColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 184,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      // In order to have the ink splash appear above the image, you
                                      // must use Ink.image. This allows the image to be painted as
                                      // part of the Material and display ink effects above it. Using
                                      // a standard Image will obscure the ink splash.
                                      child: Ink.image(
                                        image: AssetImage('images/vivi.jpg'),
                                        fit: BoxFit.cover,
                                        child: Container(),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Vivi Bubble Tea',
                                          style: titleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Description and share/explore buttons.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // This array contains the three line description on each card
                                      // demo.
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text('Bubble Tea Restaurant',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Text('Phone: (614) 817-1268'),
                                      Text(
                                          'Address: 2408 N High St, Columbus, OH 43202'),
                                      Text('Hours: 11-10PM'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  Send user to the DM page.
   */
  _onButtonPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatListScreen()));
  }
}
