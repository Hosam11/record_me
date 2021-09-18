import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/dimensions.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/models/user/user_data.dart';
import 'package:record_me/screens/base_controller.dart';
import 'package:record_me/shared_widgets/custom_text_input.dart';
import 'package:record_me/shared_widgets/shared_button.dart';
import 'package:record_me/utils/dialogs.dart';
import 'package:record_me/utils/services/storage_service.dart';

class HomeController extends GetxController {
  UserData? _userData;

  UserData? get userData => _userData;

  RxString audioName = ''.obs;

  set userData(UserData? value) {
    _userData = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final id = Get.find<StorageService>().getString(idKey);
    final email = Get.find<StorageService>().getString(emailKey);
    final name = Get.find<StorageService>().getString(nameKey);
    userData = UserData(email: email, name: name, id: id);
  }

  Future<UploadTask> uploadFile(String audioPath) async {
    Fimber.i('audioPath= $audioPath');
    UploadTask uploadTask;
    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('${userData?.id}/Audios')
        .child('${audioName.value}.mp4');

    final metadata = SettableMetadata(
      contentType: 'audio/mp4',
      customMetadata: {'picked-file-path': audioPath},
    );

    uploadTask = ref.putFile(File(audioPath), metadata);
    Fimber.i('uploadTask= $uploadTask');
    return Future.value(uploadTask);
  }

  typeAudioNameDialog() async {
    final _formKey = GlobalKey<FormState>();
    await Get.defaultDialog(
        title: typeAudioName,
        titleStyle: const TextStyle(color: kSecondaryColor),
        contentPadding: const EdgeInsets.all(mediumDimens),
        // middleText: msg ?? '',
        radius: 15,
        titlePadding: const EdgeInsets.only(top: mediumDimens),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextInput(
                hintText: audioNameHint,
                onChange: (name) {
                  audioName.value = name;
                  Fimber.i('HomeController.typeAudioNameDialog  audioName.value'
                      '=${audioName.value}');
                },
                onSaved: (name) {
                  audioName.value = name!;
                  Fimber.i('HomeController.typeAudioNameDialog  audioName.value'
                      '=${audioName.value}');
                },
                validator: (name) => validateEmptyField(name),
              ),
              const SizedBox(height: mediumDimens),
              ShardButtonWidget(
                mText: save,
                mOnPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid!) {
                    _formKey.currentState?.save;
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ));
  }

  Future<void> onStopRecord(String path) async {
    final audioSource = ap.AudioSource.uri(Uri.parse(path));
    await typeAudioNameDialog();
    Fimber.i('audioName= ${audioName.value}');
    if (audioName.value.isNotEmpty) {
      startLoading();
      try {
        await uploadFile(path);
      } catch (e) {
        stopLoading();

        showInfoDialog(error, e.toString());
      }
      stopLoading();
    }
  }
}
