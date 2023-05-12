import 'package:flutter/material.dart';
import '../classes.dart';
import '../UI_parameters.dart' as UIParameter;

// COMPONENTS
import '../components/accom_card.dart';
import '../components/search_bar.dart';
import '../components/filter_drawer.dart';

class ViewOwnedAccomms extends StatefulWidget {
  const ViewOwnedAccomms({Key? key}) : super(key: key);

  @override
  _ViewOwnedAccommsState createState() => _ViewOwnedAccommsState();
}

class _ViewOwnedAccommsState extends State<ViewOwnedAccomms> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
        ),
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
                  Container(),
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
                ],
              ),
            ),
          ),
        ));
  }
}
