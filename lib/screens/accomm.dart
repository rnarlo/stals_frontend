import 'package:stals_frontend/components/rating.dart';
import 'package:flutter/material.dart';

class AccommPage extends StatefulWidget {
  const AccommPage({super.key});
  @override
  _AccommPageState createState() => _AccommPageState();
}

class _AccommPageState extends State<AccommPage> {
  double rating = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Accomodations"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
        ],
        backgroundColor: Colors.black26,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/room_stock.jpg',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Apartment 1",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Column(children: [
              StarRating(
                rating: rating,
                onRatingChanged: (rating) =>
                    setState(() => this.rating = rating),
                color: Colors.black,
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "100+ reviews",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "P 4,500 / MO",
                style: TextStyle(fontSize: 12),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "2 Tenants - 2 Bedrooms",
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        )
      ]),
    );
  }
}


/*
body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 240, 243, 245),
                  Color.fromARGB(255, 25, 83, 95)
                ],
                stops: [0.35, 0.95],
              )
            )
          ),
          Container(
            child: Image.asset('assets/images/room_stock.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter)
          ),
          Container(
            child: Text(accom as String)
          )    
      ],)

              const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Apartment 1",
            style: TextStyle(fontSize: 28),
          ),
        )


              const Text(
          "Apartment 1",
          textAlign: TextAlign.left,
        ),
        const Text("P 4,500/ MO"),
        const Text("2 tenants - 2 bedrooms"),


                const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Apartment 1", textScaleFactor: ,
            ),

            Text('P 4,500 / MO'),

            Text('2 tenants - 2 bedroom')
          ],
        )
*/