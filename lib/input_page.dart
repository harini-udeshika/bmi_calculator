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

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     (maleCardColor == inactiveCardColor)
  //         ? (
  //             maleCardColor = activeCardColor,
  //             femaleCardColor = inactiveCardColor
  //           )
  //         : maleCardColor = inactiveCardColor;
  //   } else if (gender == Gender.female) {
  //     (femaleCardColor == inactiveCardColor)
  //         ? (
  //             femaleCardColor = activeCardColor,
  //             maleCardColor = inactiveCardColor
  //           )
  //         : femaleCardColor = inactiveCardColor;
  //   }
  // }

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
                        selectedGender = Gender.male;
                        setState(() {
                          (selectedGender == Gender.male)
                              ? maleCardColor = activeCardColor
                              : femaleCardColor = inactiveCardColor;
                        });
                      },
                      child: ReusableCard(maleCardColor,
                          GenderCard(FontAwesomeIcons.mars, "MALE")),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectedGender = Gender.female;
                        setState(() {
                          (selectedGender == Gender.female)
                              ? femaleCardColor = activeCardColor
                              : maleCardColor = inactiveCardColor;
                        });
                      },
                      child: ReusableCard(femaleCardColor,
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
