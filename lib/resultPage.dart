import 'package:flutter/material.dart';
import './constants.dart';
import 'calculatorBrain.dart';

class ResultPage extends StatelessWidget {
  String bmiResult = '';
  String resultText = '';
  String interpretation = '';
  ResultPage(this.bmiResult, this.resultText, this.interpretation);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
              child: Text(
                'YOUR RESULTS',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  color: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultText,
                        style: kRangeTextStyle,
                      ),
                      Text(bmiResult, style: kFinalResultStyle),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          RawMaterialButton(
            onPressed: () => {Navigator.pop(context)},
            child: Container(
              // padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonFontStyle,
                ),
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}
