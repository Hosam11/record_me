import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/screens/home_screen/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (homeController) => Column(
            children: [
              Text(homeController.userData?.email ?? ''),
              Text(homeController.userData?.name ?? ''),
              Text(homeController.userData?.id ?? ''),
              // Text(homeController.userData?. ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
