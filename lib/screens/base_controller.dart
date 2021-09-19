import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/utils/dialogs.dart';
import 'package:record_me/utils/services/internet_service.dart';
import 'package:record_me/utils/services/storage_service.dart';

// class BaseController {
final _internetService = Get.find<InternetService>();

Future<void> makeInternetCall(call) async {
  if (_internetService.hasConnection.value) {
    Fimber.i('makeInternetCall');
    await call();
  } else {
    showInfoDialog(
      error,
      noInternetMsg,
    );
  }
  return;
}

String? onEmailValidate(String? email) {
  if (email != null) {
    final emptyEmail = validateEmptyField(email);
    if (emptyEmail == null) {
      if (isEmailNotValid(email)) {
        return invalidEmail;
      }
    } else {
      return emptyEmail;
    }
  }
  return null;
}

String? onPasswordValidate(String? psd) => validateEmptyField(psd);

String? validateEmptyField(String? value) {
  if (value == null) {
    return requiredField;
  } else if (value.isEmpty) {
    return requiredField;
  } else {
    return null;
  }
}

bool isEmailNotValid(String email) => !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);

Future<void> saveUserData(UserCredential user) async {
  // if fb case get email
  var email = user.additionalUserInfo?.profile?['email'];
  // if email case get email
  email ??= user.user?.email;
  Fimber.i(' >> email << = $email');
  // user.credential.token;
  final userId = '${user.user?.uid}$email';
  Fimber.i('userIdStored= $userId');
  final storageServ = Get.find<StorageService>();
  await storageServ.setString(emailKey, user.user?.email ?? notFoundPref);
  await storageServ.setString(idKey, userId);
}
