import 'package:flutter/material.dart';

const double appPadding = 8.0;
const double appMargin = 8.0;
const double appRoundRadius = 32.0;
const double appRoundRadiusSmall = 16.0;

ButtonStyle appElevationButtonStyle = ButtonStyle(
  alignment: Alignment.center,
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(appRoundRadius),
    ),
  ),
);
