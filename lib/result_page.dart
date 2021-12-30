import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculate_brain.dart';

final double bmivalue = 0.0;

class ResultPage extends StatelessWidget {
  ResultPage({this.calc});

  final calc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        //backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    calc.WeightRating(calc.BMICalculate()),
                    style: TextStyle(color: Colors.green[300], fontSize: 20),
                  ),
                  Text(
                    calc.BMICalculate().toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 88,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(calc.MessageText(calc.BMICalculate()),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF1D1E33),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
