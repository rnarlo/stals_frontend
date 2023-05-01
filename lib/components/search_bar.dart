// code copied from: https://github.com/abuanwar072/Welcome-Login-Signup-Page-Flutter/blob/master/lib/components/rounded_button.dart
import 'package:flutter/material.dart';
import '../UI_parameters.dart' as UIParameter;

class SearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const SearchBar({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: onChanged,
          cursorColor: UIParameter.LIGHT_TEAL,
          style: const TextStyle(
              fontSize: UIParameter.FONT_BODY_SIZE,
              fontFamily: UIParameter.FONT_REGULAR),
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintMaxLines: 1,
            border: InputBorder.none,
          ),
        ));
  }
}
