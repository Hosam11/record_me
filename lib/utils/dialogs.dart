import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/colors.dart';

startLoading() async {
  return Get.dialog(
    const Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
    ),
  );
}

stopLoading() {
  Get.back();
}
