import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/screens/base_controller.dart';
import 'package:record_me/utils/dialogs.dart';

class LoginController extends GetxController {
  final RxBool _visiblePsd = false.obs;
  String? _email;
  String? _password;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  // ------------------------- setters -------------------------
  String? get email => _email;
  String? get password => _password;
  bool get visiblePsd => _visiblePsd.value;

  // ------------------------- setters -------------------------
  set email(String? value) {
    _email = value;
    update();
  }

  set password(String? value) {
    _password = value;
    update();
  }

  emailCallLogin() {
    makeInternetCall(_loginWithEmail);
  }

  _loginWithEmail() async {
    Fimber.i('email= $email, psd= $password  ');

    try {
      startLoading();
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Fimber.i('userCredential= $userCredential');
      saveUserData(userCredential);
      stopLoading();
      Get.toNamed(homeScreen);
    } on FirebaseAuthException catch (e) {
      stopLoading();
      Fimber.i('firebaseCode= ${e.code}');
      await showInfoDialog(error, e.message);
    } catch (e) {
      Fimber.i('error= $e');
      stopLoading();
    }
  }

  // methods
  loginWithFacebook() async {
    Fimber.i('-');
    // Trigger the sign-in flow
    try {
      startLoading();
      final LoginResult loginResult = await FacebookAuth.instance.login();

      switch (loginResult.status) {
        case LoginStatus.success:
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(loginResult.accessToken!.token);
          Fimber.i('facebookAuthCredential= ${facebookAuthCredential.asMap()}');
          // Once signed in, return the UserCredential
          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          Fimber.i('userCredential= $userCredential');
          stopLoading();

          await saveUserData(userCredential);
          Get.toNamed(homeScreen);
          break;
        case LoginStatus.cancelled:
        case LoginStatus.failed:
          await showInfoDialog(error, loginResult.message);
          stopLoading();

          break;
        case LoginStatus.operationInProgress:
          break;
      }
      Fimber.i(' status= ${loginResult.status}');
      Fimber.i(' message= ${loginResult.message}');
      Fimber.i(' accessToken= ${loginResult.accessToken}');
      // Create a credential from the access token
      // access token nullable if return without login
    } catch (e) {
      stopLoading();
      showInfoDialog(error, '$e');
      // Fimber.i('user not logged e= $e ');
    }
  }
}
