import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/screens/home_screen/home_controller.dart';
import 'package:record_me/screens/home_screen/home_widgets/audio_recorder.dart';
import 'package:record_me/screens/home_screen/home_widgets/record_row.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool showPlayer = false;
  ap.AudioSource? audioSource;

  @override
  Widget build(BuildContext context) {
    final audioSource = ap.AudioSource.uri(Uri.parse(''));

    return Scaffold(
      appBar: AppBar(
        title: const Text(myRecords),
        automaticallyImplyLeading: false, // Used for removing back buttoon.

        backwardsCompatibility: false,
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (homeController) => Column(
            children: [
              // Text(homeController.userData?.email ?? ''),
              // Text(homeController.userData?.name ?? ''),
              // Text(homeController.userData?.id ?? ''),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => RecordRow(
                    audioSource: audioSource,
                    audioName: 'test',
                  ),
                  itemCount: 0,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: kAccentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AudioRecorder(
                      onStop: homeController.onStopRecord,
                    ),
                  ),
                ),
              ),
              // Text(homeController.userData?. ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
