import 'package:flutter/material.dart';
import '../classes.dart';

import '../UI_parameters.dart' as UIParameter;

// COMPONENTS
import '../components/accom_card.dart';
import '../components/search_bar.dart';
import '../components/filter_drawer.dart';

class RegisteredHomepage extends StatefulWidget {
  const RegisteredHomepage({Key? key}) : super(key: key);

  @override
  _RegisteredHomepageState createState() => _RegisteredHomepageState();
}

class _RegisteredHomepageState extends State<RegisteredHomepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Filter accomFilter = Filter(null, null, null, null, null, null);

  /*
  a callback function that returns the filter(object) that the user chose
  Filter(
    rating;
    location;
    establishmentType;
    tenantType;
    minPrice; 
    maxPrice;
  )
   */
  void getFilter(Filter newFilter) {
    // print filter object for debug
    // print(
    //     "${newFilter.getRating()}\n${newFilter.getLocation()}\n${newFilter.getTenantType()}\n${newFilter.getEstablishmentType()}\n${newFilter.getMinPrice()}\n${newFilter.getMaxPrice()}\n");
    setState(() {
      accomFilter = newFilter;
    });
  }

  /*
  TO-DO: GET LIST OF ACCOMMODATIONS FROM DATABASE AND FILTER ACCORDING TO `accomFilter`
  initally, the homepage `accomFilter` will all be set to null, meaning all accomms will be displayed since all filter parameters are null
  as user chooses his/her filter, `accomFilter` will be set to its new state according to the filter/s the user selected
  the setstate should trigger the homepage to "reload" and display accomms that fit the new filter
  */

  @override
  Widget build(BuildContext context) {
    /*
    DUMMY OBJECT
    <Object will come from database fetch later>
    */
    var accom = AccomCardDetails("jk23fvgw23", "Centtro Residences",
        "Example Description", "assets/images/room_stock.jpg", 3, true);
    var accom2 = AccomCardDetails(
        'test1234',
        'Casa Del Mar',
        'Casa Del Mar is located at Sapphire street.',
        "assets/images/room_stock.jpg",
        5,
        true);

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
            // opens right drawer on tap
            // thinking to implement yung katulad ng filter sa shoppee?
            actions: <Widget>[
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: UIParameter.MAROON,
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
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: UIParameter.LIGHT_TEAL,
                  ),
                  child: const Text('PROFILE'),
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
        endDrawer: FilterDrawer(callback: getFilter),
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
                  AccomCard(
                    details: accom,
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1.25,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  AccomCard(details: accom2),
                ],
              ),
            ),
          ),
        ));
  }
}
