import 'package:flutter/cupertino.dart';
// FOR CLASSES

class RandomText {
  String? text;

  RandomText(this.text);

  getText() {
    return this.text;
  }
}

class AccomCardDetails {
  String ID;
  String name;
  String description;
  String image;
  double rating;
  bool isSigned;

  AccomCardDetails(this.ID, this.name, this.description, this.image,
      this.rating, this.isSigned);

  getName() {
    return name;
  }

  getDescription() {
    return description;
  }

  getImage() {
    return image;
  }

  getID() {
    return ID;
  }

  getRating() {
    return rating;
  }
}
