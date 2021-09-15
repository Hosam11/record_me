import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/record_me_app.dart';
import 'package:record_me/utils/services/api_service.dart';
import 'package:record_me/utils/services/internet_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => InternetService.init(), permanent: true);
  Get.put(ApiService(), permanent: true);

  if (kDebugMode) {
    Fimber.plantTree(DebugTree.elapsed());
  }

  runApp(
    const RecordMeApp(),
  );
}
