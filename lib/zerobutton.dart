import 'package:flutter/material.dart';

class ZeroButton extends StatelessWidget {
  final String digit;
  final Function onClick;
  const ZeroButton({super.key, required this.digit, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:7,horizontal: 4),
      child: ElevatedButton(
          onPressed: () {
            onClick(digit);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(digit,
              style:  TextStyle(color: Colors.white, fontSize: 25))),
    );;
  }
}
