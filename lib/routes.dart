import 'package:get/get.dart';
import 'package:record_me/screens/login_screen/login_screen.dart';
import 'package:record_me/screens/signup_screen/signup_screen.dart';

const initial = goSignUp;
const goLogin = 'login';
const goSignUp = 'signup';

const _loginScreen = '/login';
const _signupScreen = '/signup';

final List<GetPage> routes = [
  GetPage(name: _loginScreen, page: () => LoginScreen()),
  GetPage(name: _signupScreen, page: () => SignupScreen()),
];
