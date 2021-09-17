import 'package:flutter/material.dart';
import 'package:record_me/constants/styles.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.isAutoValidate = true,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.onChange,
    this.textInputAction,
  }) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscure;

  final TextInputType? keyboardType;

  final String? labelText;
  final String? hintText;
  final bool isAutoValidate;

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChange;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: kTextFieldDecoration.copyWith(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
      ),
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
