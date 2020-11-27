import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/screens/food_details/widgets/customExpirationLineTracker.dart';

class ExpirationWidget extends StatefulWidget {
  @override
  _ExpirationWidgetState createState() => _ExpirationWidgetState();
}

class _ExpirationWidgetState extends State<ExpirationWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '5 days left',
              style: kHeadingText3,
            ),
            IconButton(
              icon: isLiked
                  ? Icon(
                      Icons.favorite,
                      color: kPrimaryColor,
                    )
                  : Icon(
                      Icons.favorite_border,
                    ),
              onPressed: () {
                setState(() {
                  if (isLiked) {
                    isLiked = false;
                  } else {
                    isLiked = true;
                  }
                });
              },
            )
          ],
        ),
        CustomExpirationLineTracker(
          expirationPercent: 51.0,
        ),
        SizedBox(height: 18.0),
        Text(
          'Expiration date 02/11/2020',
          style: kBodyText5,
        )
      ],
    );
  }
}
