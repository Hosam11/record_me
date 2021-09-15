import 'package:flutter/material.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/styles.dart';


ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerTheme: kDivider,
    primaryColor: kPrimaryColor,
    textTheme: Theme.of(context).textTheme.apply(
          displayColor: kPrimaryColor,
          bodyColor: kPrimaryColor,
        ),
    disabledColor: kAccentColor,
    buttonTheme: const ButtonThemeData(
      disabledColor: kAccentColor,
      buttonColor: kPrimaryColor,
      textTheme: ButtonTextTheme.accent,
    ),
    // cursorColor: kPrimaryColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kSecondaryColor,
      cursorColor: kPrimaryColor,
      selectionHandleColor: kPrimaryColor,
    ),
    hintColor: kPrimaryColor,
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: kPrimaryColor),
      bodyText2: TextStyle(color: kPrimaryColor),
    ),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    colorScheme: Theme.of(context)
        .colorScheme
        .copyWith(
          secondary: kAccentColor,
          primary: kPrimaryColor,
        )
        .copyWith(secondary: kAccentColor),
  );
}
