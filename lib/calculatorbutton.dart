import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Function onClick;

  const CalculatorButton(
      {super.key, required this.digit, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical:3,horizontal: 3),
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
      ),
    );
  }
}
