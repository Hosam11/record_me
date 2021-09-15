import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _visiblePsd = false.obs;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }
}
