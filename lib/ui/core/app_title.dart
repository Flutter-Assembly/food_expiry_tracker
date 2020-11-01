import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Pantry',
        style: kHeadingText1.copyWith(color: kPrimaryColor),
        children: <TextSpan>[
          TextSpan(
            text: 'Rack',
            style: kHeadingText1.copyWith(color: kDeepYellow),
          ),
        ],
      ),
    );
  }
}
