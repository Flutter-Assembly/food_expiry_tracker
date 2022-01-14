import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class FooterText extends StatelessWidget {
  FooterText(
      {required this.textLabel, required this.textAction, required this.onTap});

  final String textLabel;
  final String textAction;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: textLabel,
          style: kBodyText4.copyWith(color: kPrimaryColor),
          children: <TextSpan>[
            TextSpan(
              text: textAction,
              style: kBodyText4.copyWith(color: kPrimaryYellow),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
