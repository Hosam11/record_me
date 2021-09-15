import 'package:get/get.dart';
import 'package:record_me/screens/login_screen/login_screen.dart';

const loginScreen = '/login';

final List<GetPage> routes = [
  GetPage(name: loginScreen, page: () => LoginScreen()),
];
