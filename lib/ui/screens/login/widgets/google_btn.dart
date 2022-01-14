import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class GoogleButton extends StatelessWidget {
  final Function() onPressed;
  GoogleButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: OutlineButton(
        color: kPrimaryBorder,
        highlightElevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/icons_google.png'),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 2,
            ),
            Text(
              'Google',
              style: kButtonTextStyle.copyWith(
                color: kPrimaryTextColor,
              ),
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
