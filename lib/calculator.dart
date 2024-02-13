import 'package:flutter/material.dart';

import 'calculatorbutton.dart';
import 'zerobutton.dart';

class CalculatorScreen extends StatefulWidget {
  static String routeName = "calculator";

  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String result = "";
  String lhs = "";
  String savedOpeator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.calculate_rounded,color: Colors.white,size: 32,),
            SizedBox(width: 5,),
            Text("Calculator",style: TextStyle(color: Colors.white),),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 190,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(result, style: TextStyle(fontSize: 35),),
            )),
            SizedBox(width: 30,)
                          ],
                        )),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "AC", onClick: (_) => OnDeletClick()),
                CalculatorButton(digit: "+/-", onClick: OnOperatorClick,),
                CalculatorButton(digit: "%", onClick: OnOperatorClick,),
                CalculatorButton(digit: "/", onClick: OnOperatorClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "7", onClick: OnDigitClick,),
                CalculatorButton(digit: "8", onClick: OnDigitClick,),
                CalculatorButton(digit: "9", onClick: OnDigitClick,),
                CalculatorButton(digit: "x", onClick: OnOperatorClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "4", onClick: OnDigitClick,),
                CalculatorButton(digit: "5", onClick: OnDigitClick,),
                CalculatorButton(digit: "6", onClick: OnDigitClick,),
                CalculatorButton(digit: "-", onClick: OnOperatorClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "1", onClick: OnDigitClick,),
                CalculatorButton(digit: "2", onClick: OnDigitClick,),
                CalculatorButton(digit: "3", onClick: OnDigitClick,),
                CalculatorButton(digit: "+", onClick: OnOperatorClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex:2,child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: ZeroButton(digit: "0", onClick: OnDigitClick,),
                )),
                CalculatorButton(digit: ".", onClick: OnDigitClick,),
                CalculatorButton(digit: "=", onClick: OnEqualClick,),
              ],
            ),
          )
        ],
      ),
    );
  }

  void OnDigitClick(String digit) {
    if(result.contains(".")) return;
    result += digit;
    setState(() {});
  }

  void OnOperatorClick(String operator) {
    if(savedOpeator.isEmpty){
      lhs = result;
      savedOpeator = operator;
    }else{
      lhs = calucalate(lhs, savedOpeator, result);
      savedOpeator = operator;
    }
    result = "";
  }

  void OnEqualClick(_) {
    result = calucalate(lhs, savedOpeator, result);
    lhs = "";
    savedOpeator = "";
    setState(() {
    });
  }

  String calucalate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double result;

    if(operator == "AC"){
    result = 0;
    n1 = 0;
    n2 = 0;
    }else if (operator == "+") {
      result = n1 + n2;
    } else if (operator == "-") {
      result = n1 - n2;
    } else if (operator == "x") {
      result = n1 * n2;
    } else if (operator == "/") {
      result = n1 / n2;
    } else if (operator == "+/-") {
      result = -n1;
      n2 = -n2;
    } else if (operator == "%") {
      result = n1 % n2;
    } else {
      return "Invalid operator";
    }

    return result.toString();
  }

  void OnDeletClick(){
    result = "";
    lhs = "";
    savedOpeator = "";
    setState(() {});
  }
}
