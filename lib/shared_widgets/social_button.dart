import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.socialIcon,
    this.mOnPressed,
    this.mColor,
  }) : super(key: key);

  final Color? mColor;
  final IconData socialIcon;
  final void Function()? mOnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: IconButton(
        onPressed: mOnPressed,
        icon: Icon(
          socialIcon,
          size: 40,
          color: mColor,
        ),
      ),
    );
  }
}
