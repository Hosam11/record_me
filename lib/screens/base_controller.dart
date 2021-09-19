import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/utils/dialogs.dart';
import 'package:record_me/utils/services/internet_service.dart';
import 'package:record_me/utils/services/storage_service.dart';

// class BaseController {
final _internetService = Get.find<InternetService>();

void makeInternetCall(call) {
  if (_internetService.hasConnection.value) {
    Fimber.i('');
    call();
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

saveUserData(UserCredential user) async {
  // user.credential.token;
  final storageServ = Get.find<StorageService>();
  await storageServ.setString(emailKey, user.user?.email ?? notFoundPref);
  await storageServ.setString(idKey, user.user?.uid ?? notFoundPref);
}
