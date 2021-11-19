import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class Indicator extends StatelessWidget {
  Indicator({this.active = true});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 15.0 : 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : kIndicatorColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
