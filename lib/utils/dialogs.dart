import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/dimensions.dart';

startLoading() async {
  return await Get.dialog(
    const Center(
      child: CircularProgressIndicator(
        color: kAccentColor,
      ),
    ),
  );
}

stopLoading() {
  Get.back();
}

Future<void> showInfoDialog(String title, String? msg) async {
  return await Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(color: kSecondaryColor),
    contentPadding: const EdgeInsets.all(mediumDimens),
    middleText: msg ?? '',
    radius: 15,
    titlePadding: const EdgeInsets.only(top: mediumDimens),
  );
}
