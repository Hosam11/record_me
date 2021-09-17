import 'package:get/get.dart';
import 'package:record_me/models/user/user_data.dart';
import 'package:record_me/utils/services/storage_service.dart';

class HomeController extends GetxController {
  UserData? _userData;

  UserData? get userData => _userData;

  set userData(UserData? value) {
    _userData = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final id = Get.find<StorageService>().getString(idKey);
    final email = Get.find<StorageService>().getString(emailKey);
    final name = Get.find<StorageService>().getString(nameKey);
    userData = UserData(email: email, name: name, id: id);
  }
}
