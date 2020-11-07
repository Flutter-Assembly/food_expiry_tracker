import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class ButtonOutline extends StatelessWidget {
  ButtonOutline({
    @required this.title,
    @required this.onPressed,
    this.textColor,
    this.borderColor,
  });

  final Color textColor;
  final Color borderColor;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return  OutlineButton(
      borderSide: BorderSide(
          color: borderColor,
          width: 1,
          style: BorderStyle.solid
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      highlightedBorderColor: kDeepYellow,
      highlightElevation: 2.0,
      child: Text(
        title,
        style: kButtonTextStyle.copyWith(
          color: textColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
