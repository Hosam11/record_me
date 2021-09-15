import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/constants/themes.dart';
import 'package:record_me/routes.dart';
import 'package:record_me/screens/login_screen/login_screen.dart';

class RecordMeApp extends StatelessWidget {
  const RecordMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: getAppTheme(context),
      // home: LoginScreen(),
      getPages: routes,
      initialRoute: initial,
    );
  }
}
