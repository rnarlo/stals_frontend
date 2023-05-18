import 'package:flutter/material.dart';
import 'package:stals_frontend/components/pending_accom_card.dart';
import 'package:stals_frontend/screens/admin/admin_dashboard.dart';
import 'package:stals_frontend/screens/admin/admin_view_pending_approved.dart';
import 'package:stals_frontend/screens/admin/admin_view_archived.dart';
import 'package:stals_frontend/screens/registered_user/homepage_signed.dart';
import '../../classes.dart';
import '../../UI_parameters.dart' as UIParameter;
import '../../components/accom_card.dart';

class AdminViewAccommodations extends StatefulWidget {
  const AdminViewAccommodations({Key? key}) : super(key: key);

  @override
  _AdminViewAccommodationsState createState() =>
      _AdminViewAccommodationsState();
}

class _AdminViewAccommodationsState extends State<AdminViewAccommodations> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;

  final List<Widget> _children = [
    AdminDashBoard(),
    AdminViewPendingApproved(),
    ViewArchivedAccommodations(),
  ];

  void onTabChosen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabChosen,
        backgroundColor: UIParameter.WHITE,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_outlined), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.house), label: "Accommodations"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archived"),
        ],
        selectedItemColor: Color(0xff19535F),
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
      ),
    );
  }
}
