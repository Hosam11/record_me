import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/utils/dialogs.dart';
import 'package:record_me/utils/services/storage_service.dart';

class LoginController extends GetxController {
  final RxBool _visiblePsd = false.obs;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  loginWithFacebook() async {
    Fimber.i('-');
    // Trigger the sign-in flow
    try {
      startLoading();
      final LoginResult loginResult = await FacebookAuth.instance.login();
      Fimber.i(' status= ${loginResult.status}');
      Fimber.i(' message= ${loginResult.message}');
      Fimber.i(' accessToken= ${loginResult.accessToken}');
      // Create a credential from the access token
      // access token nullable if return without login
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
    } catch (e) {
      Fimber.i('user not logged e= $e ');
    }
  }

  saveUserData(UserCredential user) async {
    final storageServ = Get.find<StorageService>();
    await storageServ.setString(emailKey, user.user?.email ?? notFoundPref);
    await storageServ.setString(idKey, user.user?.uid ?? notFoundPref);
    await storageServ.setString(
        tokenKey, user.credential?.token.toString() ?? notFoundPref);
  }
}
