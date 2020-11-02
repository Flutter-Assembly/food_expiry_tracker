import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class ButtonSolid extends StatelessWidget {
  ButtonSolid({
    @required this.title,
    @required this.onPressed,
    this.textColor,
    this.bgColor,
  });

  final Color textColor;
  final Color bgColor;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: bgColor,
      elevation: 0.5,
      child: Text(
        title,
        style: kButtonTextStyle.copyWith(
          color: textColor,
        ),
      ),
      height: 40.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(5.0),
      ),
    );
  }
}
