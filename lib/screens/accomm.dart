import 'dart:html';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App bar start
        appBar: AppBar(
          title: const Text("All Accomodations"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
          ],
          backgroundColor: Colors.black26,
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
                Expanded(
                  //Image File
                  child: Image.asset(
                    'assets/images/room_stock.jpg',
                  ),
                ),
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
            const Column(
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

            //end of contact info
            // const SizedBox(
            //   height: 5,
            // ),
            // const Divider(
            //   color: Colors.black,
            // ),

            //CARD for ROOM Capacity/Type/Price
            //On-going
            //can't scroll for some reason
            //Cards
            // SizedBox(
            //     height: 50,
            //     width: MediaQuery.of(context).size.width,
            //     child: PageView.builder(
            //         itemCount: 5,
            //         pageSnapping: true,
            //         itemBuilder: (context, pagePosition) {
            //           return Scaffold(
            //             body: Center(
            //                 child: SizedBox(
            //               height: 50,
            //               child: PageView.builder(
            //                 itemCount: 5,
            //                 controller: PageController(viewportFraction: 0.7),
            //                 onPageChanged: (int index) =>
            //                     setState(() => _index = index),
            //                 itemBuilder: (_, i) {
            //                   return Transform.scale(
            //                     scale: i == _index ? 1 : 0.9,
            //                     child: Card(
            //                       elevation: 6,
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(20)),
            //                       child: Center(
            //                           child: Text(
            //                         "Card ${i + 1}",
            //                         style: const TextStyle(fontSize: 32),
            //                       )),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             )),
            //           );
            //         })),
            //end of cards

            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
            ),

            //need to fix tab or text align
            //or is it just cuz im not using android emulator

            //Description
            // const Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         height: 4,
            //         width: 25,
            //       ),
            //       Expanded(
            //           child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           FittedBox(
            //             alignment: Alignment.topLeft,
            //             child: Text(
            //               "About [Name]",
            //               maxLines: 1,
            //               style: TextStyle(
            //                   fontSize: 18, fontWeight: FontWeight.normal),
            //               textAlign: TextAlign.start,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 2,
            //             width: 5,
            //           ),
            //           FittedBox(
            //               fit: BoxFit.contain,
            //               child: Text(
            //                 "About Descriptaasdasdasdasdasaasdasdaaaaaasddddddddddddddddddddddddddddddaaaaaaaasdasdasdasdaaa",
            //                 maxLines: 1,
            //                 style: TextStyle(
            //                     fontSize: 12, fontWeight: FontWeight.normal),
            //               )),
            //         ],
            //       ))
            //     ]),
            //end of Description
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
            ),

            //Highlights
            const Column(
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    "Highlights",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.pets,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Pets Allowed",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bathtub_outlined,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Own Bathroom",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.restaurant_menu,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Cooking Allowed",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.wifi,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "With Internet Connection",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.ac_unit,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Air-conditioned room",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bedtime_off,
                      color: Colors.blue,
                      size: 40,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "No Curfew",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
              ],
            )
            //end of highlights
          ]),
        ));
  }
}



/*

Flexible(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "About Descriptaasdasdasdasdasaaaaaa",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ))),


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