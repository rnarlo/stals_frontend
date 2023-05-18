import 'package:flutter/material.dart';
import '../classes.dart';
import '../UI_parameters.dart' as UIParameter;

// COMPONENTS
import '../components/accom_card.dart';
// import '../components/search_bar.dart';
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

  // this builds the filters shown on the homepage according to user/s filter choices/selections
  Widget _displayFilter(String filterValue, String filterTitle) {
    var isRating = false;
    var isMinPrice = false;
    var isMaxPrice = false;

    // if the filter is `rating'
    if (filterTitle == "Rating") {
      isRating = true;
      // if the filter is the min price
    } else if (filterTitle == "Min Price") {
      isMinPrice = true;
      // if the filter is the max price
    } else if (filterTitle == "Max Price") {
      isMaxPrice = true;
    }

    if (isRating) {
      // turn the rating into a single integet and make it into a string
      filterValue = ((double.parse(filterValue)).toInt()).toString();
    }
    if (isMinPrice) {
      // add MIN:
      filterValue = "MIN: $filterValue";
    }
    if (isMaxPrice) {
      // add MAX:
      filterValue = "MAX: $filterValue";
    }

    return UnconstrainedBox(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: UIParameter.LIGHT_TEAL,
        ),
        child: Row(
          children: [
            Text(
              filterValue,
              style: const TextStyle(
                  fontFamily: UIParameter.FONT_REGULAR,
                  fontSize: UIParameter.FONT_BODY_SIZE,
                  color: Colors.white),
            ),
            // if the filter is `rating` we will append a star icon to the text
            isRating
                ? const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  )
                : Container(),
            InkWell(
                /*
                allows user to remove/delete existing filters
                automatically updates the `Filter` of the homepage using setState which should also
                update the accommodations shown (reload accomms in homepage)
                */
                onTap: () {
                  Filter newFilter = Filter(
                      filterTitle == "Rating" ? null : accomFilter.getRating(),
                      filterTitle == "Location"
                          ? null
                          : accomFilter.getLocation(),
                      filterTitle == "Establishment Type"
                          ? null
                          : accomFilter.getEstablishmentType(),
                      filterTitle == "Tenant Type"
                          ? null
                          : accomFilter.getTenantType(),
                      filterTitle == "Min Price"
                          ? null
                          : accomFilter.getMinPrice(),
                      filterTitle == "Max Price"
                          ? null
                          : accomFilter.getMaxPrice());
                  setState(() {
                    accomFilter = newFilter;
                  });
                },
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 16,
                )),
          ],
        ),
      ),
    );
  }

  /*
  TO-DO: GET LIST OF ACCOMMODATIONS FROM DATABASE AND FILTER ACCORDING TO `accomFilter`
  initally, the homepage `accomFilter` will all be set to null, meaning all accomms will be displayed since all filter parameters are null
  as user chooses his/her filter, `accomFilter` will be set to its new state according to the filter/s the user selected
  the setstate should trigger the accomms in the homepage to reload (display accomms that fit the new filter)
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

    var filterTitleList = [];
    var filterValueList = [];
    var filterRaw = accomFilter.getFiltersApplied();
    for (int i = 0; i < filterRaw.length; i++) {
      filterValueList.add(filterRaw[i][0]);
      filterTitleList.add(filterRaw[i][1]);
    }

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
        endDrawer: FilterDrawer(filter: accomFilter, callback: getFilter),
        body: SingleChildScrollView(
          child: Container(
            // get the height and width of the device
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            color: UIParameter.WHITE,
            child: Center(
              child: Column(
                children: [
                  // if the Filter object of the homepage is not null (atleast one filter is selected)
                  // we will build the Filter to be displayed
                  if (!accomFilter.isEmpty())
                    Wrap(children: [
                      for (int i = 0; i < filterValueList.length; i++)
                        if (filterValueList[i] != null)
                          _displayFilter(
                              filterValueList[i].toString(), filterTitleList[i])
                    ])
                  // else there is no Filter currently selected
                  // we build nothing
                  else
                    Container(),
                  // 1 accomm card for demo
                  // to create a component later that will build all the AccomCard of all fetched accommodation from database
                  const SizedBox(
                    height: 10,
                  ),
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
