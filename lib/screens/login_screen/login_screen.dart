import 'package:fimber/fimber.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/assets.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/dimensions.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/constants/styles.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/screens/base_controller.dart';
import 'package:record_me/screens/login_screen/login_controller.dart';
import 'package:record_me/shared_widgets/custom_text_input.dart';
import 'package:record_me/shared_widgets/shared_button.dart';
import 'package:record_me/shared_widgets/social_button.dart';

const bottomPadding = EdgeInsets.only(bottom: mediumDimens);

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    Fimber.i('size.width * 0.2= ${size.width * 0.2}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetX<LoginController>(
            init: LoginController(),
            builder: (_loginController) => Form(
              key: _formKey,
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  children: [
                    const SizedBox(height: largeDimens),
                    // ------------------ logo  ------------------
                    Image.asset(
                      logoImg,
                      width: context.isPortrait
                          ? size.width * 0.4
                          : size.height * 0.4,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: largeDimens),
                      child: Text(
                        welcomeMsg,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: kAccentColor),
                      ),
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
                        obscure: !_loginController.visiblePsd,
                        validator: onPasswordValidate,
                        onSaved: onPasswordSaved,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _loginController.visiblePsd
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            _loginController.toggleVisiblePsd();
                          },
                        ),
                      ),
                    ),
                    // ------------------ login button ------------------
                    ShardButtonWidget(
                      mText: signIn,
                      mWidth: size.width,
                      mOnPressed: onEmailLoginPressed,
                    ),
                    // ------------------new user msg ------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text.rich(
                        TextSpan(
                          text: newUser,
                          style: const TextStyle(),
                          children: <TextSpan>[
                            TextSpan(
                              text: singUpHere,
                              recognizer: TapGestureRecognizer()
                                ..onTap = signupPressed,
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
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(16).copyWith(top: 20),
                      child: const Text(
                        orLoginWith,
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
                            mOnPressed: () {
                              signInWithFacebook(_loginController);
                              Fimber.i('');
                            },
                          ),
                          /* SocialButton(
                            socialIcon: FontAwesomeIcons.twitter,
                            mColor: const Color(0xFF5DA9DD),
                            mOnPressed: onTwitterPressed,
                          ),
                          SocialButton(
                            socialIcon: FontAwesomeIcons.google,
                            mColor: const Color(0xFFF10E3B),
                            mOnPressed: signInWithGoogle,
                          ),*/
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
    _loginController.email = email;
  }

  void onPasswordSaved(String? password) {
    _loginController.password = password;
  }

  void signupPressed() {
    Get.toNamed(signupScreen);
  }

  Future<void> onEmailLoginPressed() async {
    Fimber.i('login');
    // final userCred = await signInWithFacebook();
    final valid = _formKey.currentState?.validate();
    if (valid != null) {
      if (valid) {
        _formKey.currentState?.save();
        _loginController.emailCallLogin();
      }
    }
  }

  Future<void> signInWithFacebook(LoginController loginController) async {
    // final x = Get.find<LoginController>();
    await loginController.loginWithFacebook();
  }

  void signInWithGoogle() {}

  void onTwitterPressed() {}
}
