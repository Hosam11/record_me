import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/screens/home_screen/home_controller.dart';
import 'package:record_me/screens/home_screen/home_widgets/audio_recorder.dart';
import 'package:record_me/screens/home_screen/home_widgets/record_row.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(myRecords),
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => Get.find<HomeController>().getVideoData(),
        child: SafeArea(
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) {
              final x = homeController.voices;
              Fimber.i('voices= ${x}');
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) => RecordRow(
                        videoModel: homeController.voices[index],
                        onVoiceDelete: () =>
                            onDeleteVoice(homeController.voices[index].name),
                      ),
                      itemCount: homeController.voices.length,
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
              );
            },
          ),
        ),
      ),
    );
  }

  void onDeleteVoice(String name) {
    Get.find<HomeController>().deleteVoice(name);
  }
}
