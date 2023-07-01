import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData genderIcon;
  final String subtitle;
  GenderCard(this.genderIcon, this.subtitle);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(genderIcon, size: 80),
      SizedBox(
        height: 15,
      ),
      Text(subtitle, style: kLabelTextStyle)
    ]);
  }
}
