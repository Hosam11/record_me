import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/strings.dart';

class RecordMeApp extends StatelessWidget {
  const RecordMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Column(
        children: const [
          Text('Flutter Demo Home Page'),
        ],
      ),
    );
  }
}
