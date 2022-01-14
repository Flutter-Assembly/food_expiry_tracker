import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class FoodDetailsRichText extends StatelessWidget {
  final String title;
  final String subTitle;

  FoodDetailsRichText({required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: RichText(
        text: TextSpan(
          text: '$title\n',
          style: kBodyText5,
          children: <InlineSpan>[
            TextSpan(
              text: '$subTitle',
              style: kBodyText3.copyWith(
                color: Color(0XFF151515),
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
