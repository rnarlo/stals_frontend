import 'package:flutter/material.dart';

class PendingAccomCard extends StatefulWidget {
  String accomName;
  String ownerName;

  PendingAccomCard({Key? key, required this.accomName, required this.ownerName})
      : super(key: key);

  @override
  State<PendingAccomCard> createState() => _PendingAccomCardState();
}

class _PendingAccomCardState extends State<PendingAccomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.accomName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                widget.ownerName,
                style: TextStyle(fontSize: 14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 243, 245),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        foregroundColor: Color(0xff19535F),
                        backgroundColor: Color.fromARGB(255, 240, 243, 245),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 35,
                          color: Color(0xff19535F),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 243, 245),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        foregroundColor: Color(0xff7B2D26),
                        backgroundColor: Color.fromARGB(255, 240, 243, 245),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 35,
                        color: Color(0xff7B2D26),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )));
  }
}
