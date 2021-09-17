import 'package:get/get.dart';
import 'package:record_me/screens/home_screen/home_screen.dart';
import 'package:record_me/screens/login_screen/login_screen.dart';
import 'package:record_me/screens/signup_screen/signup_screen.dart';

const initial = loginScreen;
// const goLogin = 'login';
// const goSignUp = 'signup';
// const goHome = 'home';

const loginScreen = '/login';
const signupScreen = '/signup';
const homeScreen = '/home';

final List<GetPage> routes = [
  GetPage(name: loginScreen, page: () => LoginScreen()),
  GetPage(name: signupScreen, page: () => SignupScreen()),
  GetPage(name: homeScreen, page: () => HomeScreen()),
];
