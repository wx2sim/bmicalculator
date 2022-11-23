import 'package:bmicalculator/Const.dart';
import 'package:bmicalculator/components/reuseablecard.dart';
import 'package:flutter/material.dart';
import '../components/bottom_botton.dart';
import 'package:bmicalculator/caclulator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.BMI, @required this.Result, @required this.Interp});
  final String BMI;
  final String Result;
  final String Interp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kTitleTextStyle,
                )),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              Coloor: kActiveCardColor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Result,
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    BMI,
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Interp,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-Calculate')
        ],
      ),
    );
  }
}
