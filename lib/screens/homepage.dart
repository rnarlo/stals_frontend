import 'package:flutter/material.dart';

class UnregisteredHomepage extends StatefulWidget {
  const UnregisteredHomepage({super.key});
  @override
  _UnregisteredHomePageState createState() => _UnregisteredHomePageState();
}

class _UnregisteredHomePageState extends State<UnregisteredHomepage> {
  @override
  Widget build(BuildContext context) {
    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 67, 134, 221),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
            textStyle: const TextStyle(fontSize: 12)),
        onPressed: () async {
          Navigator.pop(context);
        },
        child: const Text('Back', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            backButton,
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "This is the homepage.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          ],
        ),
      ),
    );
  }
}