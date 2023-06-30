import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'genderCard.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0XFFEA1556);
const inactiveCardColor = Color(0XFF11132B);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  late Gender selectedGender;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
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
                              ? activeCardColor
                              : inactiveCardColor,
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
                              ? activeCardColor
                              : inactiveCardColor,
                          GenderCard(FontAwesomeIcons.mercury, "FEMALE")),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  activeCardColor,
                  Row(
                    children: [],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        activeCardColor,
                        Column(
                          children: [],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        activeCardColor,
                        Column(
                          children: [],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
