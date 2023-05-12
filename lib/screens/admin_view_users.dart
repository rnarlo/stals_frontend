import 'package:flutter/material.dart';
import '../UI_parameters.dart' as UIParameter;

class ViewUsersPage extends StatefulWidget {
  const ViewUsersPage({super.key});
  @override
  State<ViewUsersPage> createState() => _ViewUsersPageState();
}

class _ViewUsersPageState extends State<ViewUsersPage> {
  List<dynamic> users = [
    "John Smith",
    "Juan de la Cruz",
    "Manuel Quezon III",
    "Jose Rizal",
    "Roland Dagon"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final profileIcon = SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Image(image: AssetImage('icons/profile.png')),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10))
      ]),
    );

    final backButton = Center(
        child: SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 67, 134, 221),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 13),
                    textStyle: const TextStyle(fontSize: 12)),
                onPressed: () async {
                  Navigator.pop(context);
                },
                child:
                    const Text('Back', style: TextStyle(color: Colors.white)),
              ),
            )));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 460,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
              offset: Offset(0, -5.0),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            var user = users[index];
            return ListTile(
              onTap: () {},
              leading: Icon(Icons.person),
              title: Text("${users[index]}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Color.fromRGBO(212, 57, 65, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 13),
                    textStyle: const TextStyle(fontSize: 12)),
                onPressed: () {},
                child: null,
              ),
            );
          }),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: selectedIndex,
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      //   destinations: [],
      // ),
    );
  }
}
