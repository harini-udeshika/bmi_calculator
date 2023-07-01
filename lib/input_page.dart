import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'genderCard.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  late Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                          (selectedGender == Gender.male)
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          GenderCard(FontAwesomeIcons.mars, "MALE")),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                          (selectedGender == Gender.female)
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          GenderCard(FontAwesomeIcons.mercury, "FEMALE")),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('cm', style: kLabelTextStyle)
                          ]),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: kBottomContainerColor,
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kTextColor),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                          min: 120,
                          max: 220,
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight += 1;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                }),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age += 1;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age -= 1;
                                  });
                                }),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton(this.child, this.onpress);

  final IconData child;
  final VoidCallback onpress;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: onpress,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
