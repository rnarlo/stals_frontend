import 'package:flutter/material.dart';
import '../classes.dart';

// COMPONENTS
import '../components/accom_card.dart';
import '../components/search_bar.dart';

class RegisteredHomepage extends StatefulWidget {
  const RegisteredHomepage({Key? key}) : super(key: key);

  @override
  _RegisteredHomepageState createState() => _RegisteredHomepageState();
}

class _RegisteredHomepageState extends State<RegisteredHomepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    /*
    DUMMY OBJECT
    <Object will come from database fetch later>
    */
    var accom = AccomCardDetails("jk23fvgw23", "Centrro Residences",
        "Description of Centrro Residences", "assets/images/room_stock.jpg", 3);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Color(0xffF0F3F5),
            elevation: 0,
            // hamburger icon for profile
            // opens left drawer on tap
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: Color(0xff0B7A75),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  //scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
            ),
            // search bar at the top of the homepage
            title: SearchBar(
              hintText: 'Search',
              onChanged: (value) {
                /* PUT SEARCH FUNCTION HERE */
              },
            ),
            // filter icon for filtered search
            // opens right drawer on tap
            // thinking to implement yung katulad ng filter sa shoppee?
            actions: <Widget>[
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.filter_alt),
                    color: Color(0xff7B2D26),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                },
              )
            ]),
        // the left drawer
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff0B7A75),
                  ),
                  child: Text('PROFILE'),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        // the right drawer
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff7B2D26),
                  ),
                  child: Text('FILTER'),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // get the height and width of the device
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            color: Color(0xffF0F3F5),
            child: Center(
              child: Column(
                children: [
                  // 1 accomm card for demo
                  // to create a component later that will build all the AccomCard of all fetched accommodation from database
                  AccomCard(
                    details: accom,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
