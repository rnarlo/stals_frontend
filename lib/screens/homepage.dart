import 'package:flutter/material.dart';
import '../classes.dart';
import '../UI_parameters.dart' as UIParameter;
// COMPONENTS
import '../components/accom_card.dart';
// import '../components/search_bar.dart';

class UnregisteredHomepage extends StatefulWidget {
  const UnregisteredHomepage({Key? key}) : super(key: key);

  @override
  _UnregisteredHomepageState createState() => _UnregisteredHomepageState();
}

class _UnregisteredHomepageState extends State<UnregisteredHomepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    /*
    DUMMY OBJECT
    <Object will come from database fetch later>
    */
    var accom = AccomCardDetails(
        "jk23fvgw23",
        "Centrro Residences",
        "Description of Centrro Residences",
        "assets/images/room_stock.jpg",
        3,
        false);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: UIParameter.WHITE,
            elevation: 0,
            // hamburger icon for profile
            // opens left drawer on tap
            leading: IconButton(
              icon: const Icon(Icons.menu),
              color: UIParameter.LIGHT_TEAL,
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
            actions: <Widget>[
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: UIParameter.MAROON,
                    onPressed: () {
                      // cannot use filter if not signed-in
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
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: UIParameter.LIGHT_TEAL,
                  ),
                  child: const Text(''),
                ),
              ),
              ListTile(
                title: const Text('Sign In'),
                onTap: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),
              ListTile(
                title: const Text('Sign Up'),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
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
            padding: const EdgeInsets.all(20),
            color: UIParameter.WHITE,
            child: Center(
              child: Column(
                children: [
                  // 1 accomm card for demo
                  // to create a component later that will build all the AccomCard of all fetched accommodation from database
                  AccomCard(details: accom),
                ],
              ),
            ),
          ),
        ));
  }
}
