import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class AppTitle extends StatelessWidget {
  AppTitle({this.innerApp = false});
  final bool innerApp;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Pantry',
        style: innerApp
            ? kHeadingText2.copyWith(color: kPrimaryColor)
            : kHeadingText1.copyWith(color: kPrimaryColor),
        children: <TextSpan>[
          TextSpan(
            text: 'Rack',
            style: innerApp
                ? kHeadingText2.copyWith(color: kDeepYellow)
                : kHeadingText1.copyWith(color: kDeepYellow),
          ),
        ],
      ),
    );
  }
}
