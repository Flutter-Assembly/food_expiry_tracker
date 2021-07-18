import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

/*To home information like Stored, In Storage, Expired, etc*/
class UserFoodInfo extends StatelessWidget {
  final int amount;
  final String title;

  UserFoodInfo({
    @required this.title,
    @required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$amount',
          style: kHeadingText2Medium,
        ),
        Text(
          title,
          style: kBodyText3Medium,
        ),
      ],
    );
  }
}
