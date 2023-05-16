import 'package:flutter/material.dart';
import 'package:stals_frontend/components/pending_accom_card.dart';
import '../classes.dart';
import '../UI_parameters.dart' as UIParameter;
import '../components/accom_card.dart';

class AdminViewPendingApproved extends StatefulWidget {
  const AdminViewPendingApproved({Key? key}) : super(key: key);

  @override
  _AdminViewPendingApprovedState createState() =>
      _AdminViewPendingApprovedState();
}

class _AdminViewPendingApprovedState extends State<AdminViewPendingApproved> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var accom1 = AccomCardDetails(
        "accommId1",
        "Accommodation1",
        "This is a description for accommodation 1",
        "assets/images/room_stock.jpg",
        3,
        true);
    var accom2 = AccomCardDetails(
        "accommId2",
        "Accommodation2",
        "This is a description for accommodation 2",
        "assets/images/room_stock.jpg",
        5,
        true);
    var accom3 = AccomCardDetails(
        "accommId3",
        "Accommodation3",
        "This is a description for accommodation 3",
        "assets/images/room_stock.jpg",
        2,
        true);

    var pendingaccom1 = PendingAccomCard(
        accomName: "Villegas Compound", ownerName: "Owner Name");
    var pendingaccom2 = PendingAccomCard(
        accomName: "Carlos Santos Apartments", ownerName: "Owner Name");

    var approvedAccomms = Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text("Approved", style: TextStyle(fontSize: 18)),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
      ),
      AccomCard(details: accom1),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
      ),
      AccomCard(details: accom2),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
      ),
      AccomCard(details: accom3),
    ]);

    var pendingAccomms = Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Pending", style: TextStyle(fontSize: 18)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
        ),
        pendingaccom1,
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
        ),
        pendingaccom2,
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              color: UIParameter.WHITE,
              child: SingleChildScrollView(
                child: Column(children: [
                  pendingAccomms,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1.25,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  approvedAccomms,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
