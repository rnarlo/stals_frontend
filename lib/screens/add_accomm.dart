import 'package:flutter/material.dart';

class AddAccommPage extends StatefulWidget {
  const AddAccommPage({super.key});
  @override
  _AddAccommPageState createState() => _AddAccommPageState();
}

class _AddAccommPageState extends State<AddAccommPage> {
  int activestep = 0;
  int stepcount = 3;
  String accommType = "";
  String guestType = "";
  bool showGuestTypeError = false;
  bool showAccommTypeError = false;

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const accommTypeError = Text(
      "Please select an accommodation type.",
      style: TextStyle(color: Color(0xff7B2D26)),
    );

    const guestTypeError = Text(
      "Please select a guest type.",
      style: TextStyle(color: Color(0xff7B2D26)),
    );

    Widget navigationButtons = Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 50),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ElevatedButton(
              onPressed: () {
                if (activestep > 0) {
                  setState(() {
                    activestep--;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff7B2D26),
                minimumSize: const Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Back", style: TextStyle(fontSize: 17)),
            ),
            ElevatedButton(
              onPressed: () {
                if (activestep < stepcount) {
                  if (activestep == 0) {
                    if (accommType == "") {
                      setState(() {
                        showAccommTypeError = true;
                      });
                      print("Please select an accomodation type.");
                    } else {
                      setState(() {
                        activestep++;
                      });
                    }
                  } else if (activestep == 1) {
                    if (guestType == "") {
                      setState(() {
                        showGuestTypeError = true;
                      });
                      print("Please select a guest type.");
                    } else {
                      setState(() {
                        activestep++;
                      });
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff0B7A75),
                minimumSize: const Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Next", style: TextStyle(fontSize: 17)),
            ),
          ]),
        ),
      ),
    );

    Widget step0() {
      return (Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Which of these best\ndescribes your place?",
            style: TextStyle(fontSize: 27, color: Color(0xff1F2421)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(300, 70),
                            minimumSize: const Size(300, 70),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: (accommType == "house")
                                  ? const Color.fromARGB(255, 15, 170, 163)
                                  : const Color(0xff1F2421),
                            )),
                        onPressed: () {
                          setState(() {
                            accommType = "house";
                            showGuestTypeError = false;
                            print("Seleced accommodation type: " + accommType);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/home.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Text("House",
                                style: TextStyle(
                                    fontSize: 23, color: Color(0xff1F2421)))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(300, 70),
                            minimumSize: const Size(300, 70),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: (accommType == "dormitory")
                                  ? const Color.fromARGB(255, 15, 170, 163)
                                  : const Color(0xff1F2421),
                            )),
                        onPressed: () {
                          setState(() {
                            accommType = "dormitory";
                            showGuestTypeError = false;
                            print("Seleced accommodation type: " + accommType);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Image.asset(
                                  'assets/images/bunk.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Text("Dormitory",
                                  style: TextStyle(
                                      fontSize: 23, color: Color(0xff1F2421)))
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(300, 70),
                            minimumSize: const Size(300, 70),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: (accommType == "apartment")
                                  ? const Color.fromARGB(255, 15, 170, 163)
                                  : const Color(0xff1F2421),
                            )),
                        onPressed: () {
                          setState(() {
                            accommType = "apartment";
                            showGuestTypeError = false;
                            print("Seleced accommodation type: " + accommType);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/apartment.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Text("Apartment",
                                style: TextStyle(
                                    fontSize: 23, color: Color(0xff1F2421)))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(300, 70),
                            minimumSize: const Size(300, 70),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: (accommType == "transient")
                                  ? const Color.fromARGB(255, 15, 170, 163)
                                  : const Color(0xff1F2421),
                            )),
                        onPressed: () {
                          setState(() {
                            accommType = "transient";
                            showGuestTypeError = false;
                            print("Seleced accommodation type: " + accommType);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/bed.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Text("Transient",
                                style: TextStyle(
                                    fontSize: 23, color: Color(0xff1F2421)))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(300, 70),
                            minimumSize: const Size(300, 70),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: (accommType == "hotel")
                                  ? const Color.fromARGB(255, 15, 170, 163)
                                  : const Color(0xff1F2421),
                            )),
                        onPressed: () {
                          setState(() {
                            accommType = "hotel";
                            showGuestTypeError = false;
                            print("Seleced accommodation type: " + accommType);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/hotel.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(width: 35),
                            const Text("Hotel",
                                style: TextStyle(
                                    fontSize: 23, color: Color(0xff1F2421)))
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          showAccommTypeError ? accommTypeError : const SizedBox(),
          navigationButtons
        ],
      ));
    }

    Widget step1() {
      return (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Who can stay at\nyour place?",
              style: TextStyle(fontSize: 27, color: Color(0xff1F2421)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 75,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85),
                child: Container(
                    color: Colors.transparent,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(300, 70),
                                minimumSize: const Size(300, 70),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                  color: (guestType == "students")
                                      ? const Color.fromARGB(255, 15, 170, 163)
                                      : const Color(0xff1F2421),
                                )),
                            onPressed: () {
                              setState(() {
                                guestType = "students";
                                showGuestTypeError = false;
                                print("Selected guest type: " + guestType);
                              });
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Students",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color(0xff1F2421))))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(300, 70),
                                minimumSize: const Size(300, 70),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                  color: (guestType == "teachers")
                                      ? const Color.fromARGB(255, 15, 170, 163)
                                      : const Color(0xff1F2421),
                                )),
                            onPressed: () {
                              setState(() {
                                guestType = "teachers";
                                showGuestTypeError = false;
                                print("Selected guest type: " + guestType);
                              });
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Teachers",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color(0xff1F2421))))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(300, 70),
                                minimumSize: const Size(300, 70),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                  color: (guestType == "professionals")
                                      ? const Color.fromARGB(255, 15, 170, 163)
                                      : const Color(0xff1F2421),
                                )),
                            onPressed: () {
                              setState(() {
                                guestType = "professionals";
                                showGuestTypeError = false;
                                print("Selected guest type: " + guestType);
                              });
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Professionals",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color(0xff1F2421))))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(300, 70),
                                minimumSize: const Size(300, 70),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                  color: (guestType == "anyone")
                                      ? const Color.fromARGB(255, 15, 170, 163)
                                      : const Color(0xff1F2421),
                                )),
                            onPressed: () {
                              setState(() {
                                guestType = "anyone";
                                showGuestTypeError = false;
                                print("Selected guest type: " + guestType);
                              });
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Anyone",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color(0xff1F2421))))),
                      )
                    ]))),
            showGuestTypeError ? guestTypeError : const SizedBox(),
            navigationButtons
          ]));
    }

    Widget step2() {
      return (Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Where are you located?",
          style: TextStyle(fontSize: 27, color: Color(0xff1F2421)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey1,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    controller: houseNoController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff1F2421),
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 15, 170, 163),
                              width: 2,
                            )),
                        hintText: "House No., Unit No., etc."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    controller: streetController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff1F2421),
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 15, 170, 163),
                              width: 2,
                            )),
                        hintText: "Street"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff1F2421),
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 15, 170, 163),
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 175, 31, 18),
                              width: 2,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 175, 31, 18),
                              width: 1,
                            )),
                        hintText: "City"),
                    validator: ((value) {
                      if (value != null && value.trim().isEmpty) {
                        return "City required";
                      }
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160,
                          child: TextFormField(
                            controller: provinceController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1F2421),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 15, 170, 163),
                                      width: 2,
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 175, 31, 18),
                                      width: 2,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 175, 31, 18),
                                      width: 1,
                                    )),
                                hintText: "Province"),
                            validator: ((value) {
                              if (value != null && value.trim().isEmpty) {
                                return "Province required";
                              }
                            }),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: TextFormField(
                            controller: zipcodeController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1F2421),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 15, 170, 163),
                                      width: 2,
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 175, 31, 18),
                                      width: 2,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 175, 31, 18),
                                      width: 1,
                                    )),
                                hintText: "Zip Code"),
                            validator: ((value) {
                              if (value != null && value.trim().isEmpty) {
                                return "Zip Code required";
                              }
                            }),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    controller: countryController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff1F2421),
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 15, 170, 163),
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 175, 31, 18),
                              width: 2,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 175, 31, 18),
                              width: 1,
                            )),
                        hintText: "Country"),
                    validator: ((value) {
                      if (value != null && value.trim().isEmpty) {
                        return "Country required";
                      }
                    }),
                  ),
                ),
              ]),
            )),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (activestep > 0) {
                          setState(() {
                            activestep--;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff7B2D26),
                        minimumSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Back", style: TextStyle(fontSize: 17)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (activestep < stepcount) {
                          if (activestep == 2) {
                            if (_formKey1.currentState!.validate()) {
                              setState(() {
                                activestep++;
                              });
                            }
                          } else {
                            setState(() {
                              activestep++;
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff0B7A75),
                        minimumSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Next", style: TextStyle(fontSize: 17)),
                    ),
                  ]),
            ),
          ),
        )
      ]));
    }

    Widget step3() {
      return (Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Tell us about your place",
          style: TextStyle(fontSize: 27, color: Color(0xff1F2421)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
                key: _formKey2,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Name"),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: nameController,
                            validator: ((value) {
                              if (value != null && value.trim().isEmpty) {
                                return "Name required";
                              }
                            }),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xff1F2421),
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 15, 170, 163),
                                    width: 2,
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 175, 31, 18),
                                    width: 2,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 175, 31, 18),
                                    width: 1,
                                  )),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Description")),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 200,
                          child: TextFormField(
                            controller: descriptionController,
                            minLines: 5,
                            maxLines: 5,
                            validator: ((value) {
                              if (value != null && value.trim().isEmpty) {
                                return "Description required";
                              }
                            }),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xff1F2421),
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 15, 170, 163),
                                    width: 2,
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 175, 31, 18),
                                    width: 2,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 175, 31, 18),
                                    width: 1,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]))),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          activestep--;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff7B2D26),
                        minimumSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Back", style: TextStyle(fontSize: 17)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          print("Add accommodation complete.");
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff0B7A75),
                        minimumSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child:
                          const Text("Submit", style: TextStyle(fontSize: 17)),
                    ),
                  ]),
            ),
          ),
        )
      ]));
    }

    Widget getStep() {
      switch (activestep) {
        case 0:
          return step0();
        case 1:
          return step1();
        case 2:
          return step2();
        case 3:
          return step3();
        default:
          return Container();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(child: getStep()),
    );
  }
}
