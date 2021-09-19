import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/record_me_app.dart';
import 'package:record_me/utils/services/internet_service.dart';
import 'package:record_me/utils/services/storage_service.dart';

const apiKey = 'android_MTRjNjRkOWEtMmJlNC00OTlmLWExYjAtNjJiNjgzNGQ0YWUz';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => InternetService.init(), permanent: true);
  await Get.putAsync(() => StorageService.init(), permanent: true);
  await Firebase.initializeApp();

  if (kDebugMode) {
    Fimber.plantTree(DebugTree.elapsed());
  }

  runApp(
    const RecordMeApp(),
  );
}
