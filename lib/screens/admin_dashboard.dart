import 'package:flutter/material.dart';
import '../UI_parameters.dart' as UIParameter;
import '../components/search_bar.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: UIParameter.MAROON,
          elevation: 0,
          // hamburger icon for profile
          // opens left drawer on tap
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: UIParameter.WHITE,
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
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        SizedBox(
          height: 64,
          child: DrawerHeader(
              decoration: BoxDecoration(color: UIParameter.DARK_TEAL),
              child: Text(
                "Admin",
                style: TextStyle(
                    fontSize: UIParameter.FONT_HEADING_SIZE,
                    color: UIParameter.WHITE),
              )),
        ),
        ListTile(
            title: const Text('Admin 1'),
            onTap: () {
              // TODO
            },
            tileColor: UIParameter.LIGHT_TEAL),
        ListTile(
            title: const Text('Admin 2'),
            onTap: () {
              // TODO
            },
            tileColor: UIParameter.LIGHT_TEAL),
        ListTile(
            title: const Text('Admin 3'),
            onTap: () {
              // TODO
            },
            tileColor: UIParameter.LIGHT_TEAL)
      ])),
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              color: UIParameter.WHITE,
              child: Center(
                  child: Column(children: const [
                StatCard(
                    title: "Registered Users",
                    icon: Icons.person_outline_sharp,
                    value: 75),
                SizedBox(height: 10),
                StatCard(
                    title: "App Visits (Day)", icon: Icons.bar_chart, value: 7),
                SizedBox(
                  height: 10,
                ),
                StatCard(
                  title: "App Visits (Week)",
                  icon: Icons.bar_chart,
                  value: 75,
                )
              ])))),
    );
  }
}

// For cards
class StatCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final num value;
  const StatCard(
      {Key? key, required this.title, required this.icon, required this.value});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      height: 100,
      color: UIParameter.LIGHT_TEAL,
      child: Row(children: [
        SizedBox(
            width: (MediaQuery.of(context).size.width - 40) / 3,
            child: Icon(
              widget.icon,
              size: 50,
              color: UIParameter.WHITE,
            )),
        SizedBox(
            width: (MediaQuery.of(context).size.width - 40) * 2 / 3,
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: UIParameter.WHITE,
                          fontSize: UIParameter.FONT_HEADING_SIZE,
                          fontFamily: UIParameter.FONT_REGULAR,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${widget.value}",
                      style: TextStyle(
                          color: UIParameter.WHITE,
                          fontSize: UIParameter.FONT_HEADING_SIZE,
                          fontFamily: UIParameter.FONT_REGULAR,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                )))
      ]),
    );
  }
}
