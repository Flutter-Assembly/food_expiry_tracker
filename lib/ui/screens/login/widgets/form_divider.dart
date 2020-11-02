import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class FormDivider extends StatelessWidget {
  FormDivider(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppMargin),
          child: Text(
            text,
            style: kBodyText1,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
