import 'package:flutter/material.dart';

import 'indicator.dart';

Widget controlButtons(int _slideIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: <Widget>[
          _slideIndex == 0
              ? Indicator(active: true)
              : Indicator(active: false),
          _slideIndex == 1
              ? Indicator(active: true)
              : Indicator(active: false),
          _slideIndex == 2
              ? Indicator(active: true)
              : Indicator(active: false),
          _slideIndex == 3
              ? Indicator(active: true)
              : Indicator(active: false),
        ],
      ),
    ],
  );
}