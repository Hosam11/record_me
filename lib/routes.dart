import 'package:get/get.dart';
import 'package:record_me/screens/login_screen/login_screen.dart';

const loginPath = '/login';

final List<GetPage> routes = [
  GetPage(name: loginPath, page: () => const LoginScreen()),
];
