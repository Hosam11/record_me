import 'package:fimber/fimber.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/assets.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/dimensions.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/constants/styles.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/screens/base_controller.dart';
import 'package:record_me/screens/signup_screen/signup_controller.dart';
import 'package:record_me/shared_widgets/custom_text_input.dart';
import 'package:record_me/shared_widgets/shared_button.dart';
import 'package:record_me/shared_widgets/social_button.dart';
import 'package:record_me/utils/dialogs.dart';

const bottomPadding = EdgeInsets.only(bottom: mediumDimens);

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    Fimber.i('size.width * 0.2= ${size.width * 0.2}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetX<SignUpController>(
            builder: (_) => Form(
              key: _formKey,
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  children: [
                    const SizedBox(height: largeDimens),
                    Image.asset(
                      logoImg,
                      width: context.isPortrait
                          ? size.width * 0.4
                          : size.height * 0.4,
                    ),
                    SizedBox(
                      height: context.isPortrait
                          ? size.width * 0.1
                          : size.height * 0.2,
                    ),
                    // ------------------ email field ------------------
                    Padding(
                      padding: bottomPadding,
                      child: CustomTextInput(
                        labelText: email,
                        hintText: email,
                        validator: onEmailValidate,
                        onSaved: onEmailSaved,
                      ),
                    ),
                    const SizedBox(height: 8),
                    //  ------------------ password filed ------------------
                    Padding(
                      padding: bottomPadding,
                      child: CustomTextInput(
                        labelText: password,
                        hintText: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscure: !_signUpController.visiblePsd,
                        validator: onPasswordValidate,
                        onSaved: onPasswordSaved,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _signUpController.visiblePsd
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            _signUpController.toggleVisiblePsd();
                          },
                        ),
                      ),
                    ),
                    // ------------------ Signup button ------------------
                    ShardButtonWidget(
                      mText: signup,
                      mWidth: size.width,
                      mOnPressed: onSignUpPressed,
                    ),
                    // ------------------old user msg ------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text.rich(
                        TextSpan(
                          text: alreadyUser,
                          style: const TextStyle(),
                          children: <TextSpan>[
                            TextSpan(
                              text: loginHere,
                              recognizer: TapGestureRecognizer()
                                ..onTap = onLoginHerePressed,
                              style: const TextStyle(
                                color: kSecondaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            // can add more TextSpans here...
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16).copyWith(top: 20),
                      child: const Text(
                        orSignUpWith,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // ------------------ Social media buttons user msg ------------------
                    Padding(
                      padding: const EdgeInsets.only(bottom: largeDimens),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            socialIcon: FontAwesomeIcons.facebook,
                            mColor: const Color(0xFF0E8BF1),
                            mOnPressed: onFBPressed,
                          ),
                          SocialButton(
                            socialIcon: FontAwesomeIcons.twitter,
                            mColor: const Color(0xFF5DA9DD),
                            mOnPressed: onTwitterPressed,
                          ),
                          SocialButton(
                            socialIcon: FontAwesomeIcons.google,
                            mColor: const Color(0xFFF10E3B),
                            mOnPressed: onGooglePressed,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onEmailSaved(String? email) {
    _signUpController.email = email;
  }

  void onPasswordSaved(String? password) {
    _signUpController.password = password;
  }

  void onLoginHerePressed() {
    Get.toNamed(loginScreen);
  }

  void onSignUpPressed() {
    final valid = _formKey.currentState?.validate();
    if (valid != null) {
      if (valid) {
        _formKey.currentState?.save();
        _signUpController.signupEmailCall();
      }
    }
  }

  void onFBPressed() {
    showInfoDialog(error, 'This is test error body test is look pretrrt ?');
  }

  void onTwitterPressed() {}

  void onGooglePressed() {}
}
