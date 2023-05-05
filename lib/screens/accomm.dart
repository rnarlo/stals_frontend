import 'package:stals_frontend/components/rating.dart';
import 'package:flutter/material.dart';

class AccommPage extends StatefulWidget {
  const AccommPage({super.key});
  @override
  _AccommPageState createState() => _AccommPageState();
}

class _AccommPageState extends State<AccommPage> {
  double rating = 4.0;
  int _index = 1;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App bar start
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: const Text(
            "All Accommodations",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        //end of Appbar

        //Main Content for body start

        /*
        Row content Arrangement: 
        > Image
        > Apt. name - Star rating
        > Apt. Location/ Owner name and contact no.
        > Keycards/box of Rooms
          >Available or not
          >Price
          >Max occu.
          >type of room
        >Detailed Info of Apt
        >Highlighted features of Apt./Room
        >Reviews
          >Name of reviewee
          >Date
          >Review content

        */

        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/room_stock.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            favorite = !favorite;
                            // add function to add accommodation to favorites
                          });
                        },
                        child: (favorite)
                            ? Icon(
                                Icons.bookmark_outline,
                                size: 20,
                              )
                            : Icon(Icons.bookmark, size: 20),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            foregroundColor: Color.fromARGB(255, 25, 83, 95))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //optional
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 35,
                ),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Apartment 1",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 35,
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
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ],
            ),
            //Will be updated
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 3,
                ),

                //Owner Name
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage("assets/images/room_stock.jpg"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Hanse Hernandez",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),

                //Location Details
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Barangay Batong Malake, Los Baños, Laguna",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),

                //Contact Info
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.phone_in_talk_rounded,
                      color: Colors.blue,
                      size: 33,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "09123456978 / 0912-4201-619",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),

            //CARD for ROOM Capacity/Type/Price
            //On-going
            //can't scroll for some reason
            SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: 5,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Scaffold(
                        body: Center(
                            child: SizedBox(
                          height: 50,
                          child: PageView.builder(
                            itemCount: 5,
                            controller: PageController(viewportFraction: 0.7),
                            onPageChanged: (int index) =>
                                setState(() => _index = index),
                            itemBuilder: (_, i) {
                              return Transform.scale(
                                scale: i == _index ? 1 : 0.9,
                                child: Card(
                                  elevation: 6,
                                  child: Center(
                                      child: Text(
                                    "Card ${i + 1}",
                                    style: const TextStyle(fontSize: 20),
                                  )),
                                ),
                              );
                            },
                          ),
                        )),
                      );
                    })),

            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
          ]),
        ));
  }
}



/*



        class AcomCarousel extends _AccommPageState {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          appBar: AppBar(),
          body: Center(
              child: SizedBox(
            height: 50,
            child: PageView.builder(
              itemCount: 5,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Card ${i + 1}",
                      style: const TextStyle(fontSize: 32),
                    )),
                  ),
                );
              },
            ),
          )),
        );
  }
}


                    body: Center(
                        child: SizedBox(
                      height: 50,
                      child: PageView.builder(
                        itemCount: 5,
                        controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == _index ? 1 : 0.9,
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                "Card ${i + 1}",
                                style: const TextStyle(fontSize: 32),
                              )),
                            ),
                          );
                        },
                      ),
                    )),
Container(
                    
                    margin: const EdgeInsets.all(2),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Card 1",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  );
*/