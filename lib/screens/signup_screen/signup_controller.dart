import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/screens/base_controller.dart';
import 'package:record_me/utils/dialogs.dart';

class SignUpController extends GetxController {
  final RxBool _visiblePsd = false.obs;
  String? _email;
  String? _password;

  // ------------------------- getters -------------------------
  bool get visiblePsd => _visiblePsd.value;
  String? get email => _email;
  String? get password => _password;

  // ------------------------- setters -------------------------
  set email(String? value) {
    _email = value;
    update();
  }

  set password(String? value) {
    _password = value;
    update();
  }

  // ------------------------- methods -------------------------
  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  Future<void> signupEmailCall() async {
    makeInternetCall(_makeSignupCall);
  }

  Future<void> _makeSignupCall() async {
    Fimber.i('email= $email, psd= $password  ');
    startLoading();
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Fimber.i('userCredential= $userCredential');
      await showInfoDialog(congrats, emailCreatedSucess);
      saveUserData(userCredential);
      stopLoading();
      Get.toNamed(homeScreen);
    } on FirebaseAuthException catch (e) {
      stopLoading();
      Fimber.i('firebaseCode= ${e.code}');
      await showInfoDialog(error, e.message);
    } catch (e) {
      stopLoading();
      Fimber.i('error= $e');
    }
  }
}
