import 'package:flutter/material.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/dimensions.dart';

const kScreenPadding = EdgeInsets.symmetric(horizontal: 20.0);

const double kFontLabelSize = 16.0;
const TextStyle kFontLabelStyle = TextStyle(fontSize: kFontLabelSize);

const EdgeInsets kInputDecorationContentPadding = EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 20.0,
);

const InputDecoration kTextFieldDecoration = InputDecoration(
    labelStyle: kFontLabelStyle,
    contentPadding: kInputDecorationContentPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(smallRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kSecondaryColor),
      borderRadius: BorderRadius.all(normalRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.all(normalRadius),
    ),
    focusColor: kAccentColor);

const DividerThemeData kDivider = DividerThemeData(
  space: .5,
  thickness: 2.0,
);
