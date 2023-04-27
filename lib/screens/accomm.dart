import 'package:flutter/material.dart';
import 'package:stals_frontend/screens/signup.dart';

class AccommPage extends StatefulWidget {
  const AccommPage({super.key});
  @override
  _AccommPageState createState() => _AccommPageState();
}

class _AccommPageState extends State<AccommPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 240, 243, 245),
          Color.fromARGB(255, 25, 83, 95)
        ],
        stops: [0.35, 0.95],
      )),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: const <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              "This is the accommodation page.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          ],
        ),
      ),
    ));
  }
}
