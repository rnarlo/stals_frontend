import 'package:flutter/material.dart';
import '../classes.dart';
import '../UI_parameters.dart' as UIParameter;
import '../components/accom_card.dart';

class ViewArchivedAccommodations extends StatefulWidget {
  const ViewArchivedAccommodations({super.key});

  @override
  State<ViewArchivedAccommodations> createState() =>
      _ViewArchivedAccommodationsState();
}

class _ViewArchivedAccommodationsState
    extends State<ViewArchivedAccommodations> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 2;

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

    var archivedAccomms = Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text("Archived", style: TextStyle(fontSize: 18)),
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            color: UIParameter.WHITE,
            child: SingleChildScrollView(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                archivedAccomms,
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
