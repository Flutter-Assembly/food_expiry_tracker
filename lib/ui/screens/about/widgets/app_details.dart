import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

//To show Title and Description of App details in a Row.
class AppDetails extends StatelessWidget {
  final String title;
  final String description;

  AppDetails({@required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: kPrimaryBorder,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kAppBarText.copyWith(color: kSecondaryTextColor),
            ),
            Text(
              description,
              style: kBodyText1.copyWith(
                  color: kSecondaryTextColor2, fontSize: 14.0),
            ),
          ],
        ),
        Divider(
          color: kPrimaryBorder,
          thickness: 1.0,
        )
      ],
    );
  }
}
