import 'package:bmicalculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuseablecard.dart';
import '../components/icon_card.dart';
import '../Const.dart';
import '../components/round_icon_botton.dart';
import '../components/bottom_botton.dart';
import 'package:bmicalculator/caclulator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = gender.male;
                    });
                  },
                  child: ReuseableCard(
                    Coloor: selectedgender == gender.male
                        ? kNotActiveCardColor
                        : kActiveCardColor,
                    CardChild: iconcard(
                      icon: FontAwesomeIcons.mars,
                      Label: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = gender.female;
                    });
                  },
                  child: ReuseableCard(
                    Coloor: selectedgender == gender.female
                        ? kNotActiveCardColor
                        : kActiveCardColor,
                    CardChild: iconcard(
                      icon: FontAwesomeIcons.venus,
                      Label: 'Female',
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReuseableCard(
              Coloor: kActiveCardColor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kNumberTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color.fromARGB(47, 235, 21, 85),
                      inactiveTickMarkColor: Color.fromARGB(255, 94, 94, 94),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      // thumbColor: Color(0xFFAB1555)),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 230,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                          print(height);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReuseableCard(
                  Coloor: kActiveCardColor,
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT'),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconBotton(
                            icon: FontAwesomeIcons.minus,
                            OnPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconBotton(
                            icon: FontAwesomeIcons.plus,
                            OnPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  Coloor: kActiveCardColor,
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE'),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconBotton(
                            icon: FontAwesomeIcons.minus,
                            OnPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconBotton(
                            icon: FontAwesomeIcons.plus,
                            OnPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
              child: BottomButton(
            buttonTitle: 'Calculate My BMI',
            onTap: () {
              CalculatorBrain calcu =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      BMI: calcu.calculateBMI(),
                      Interp: calcu.interpitations(),
                      Result: calcu.getResult(),
                    );
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
