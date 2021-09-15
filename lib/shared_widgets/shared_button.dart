import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/colors.dart';

class ShardButtonWidget extends StatelessWidget {
  const ShardButtonWidget({
    Key? key,
    required this.mText,
    this.mOnPressed,
    this.mWidth,
    this.mColor,
  }) : super(key: key);

  final String mText;
  final void Function()? mOnPressed;
  final double? mWidth;
  final Color? mColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(5.0),
      color: mColor ?? kSecondaryColor,
      child: MaterialButton(
        minWidth: mWidth,
        onPressed: mOnPressed,
        child: Text(
          mText.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
