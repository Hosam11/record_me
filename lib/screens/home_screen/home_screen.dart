import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_me/constants/colors.dart';
import 'package:record_me/constants/strings.dart';
import 'package:record_me/screens/home_screen/home_controller.dart';
import 'package:record_me/screens/home_screen/home_widgets/audio_recorder.dart';
import 'package:record_me/screens/home_screen/home_widgets/record_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(myRecords),
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => homeController.getVideoData(),
        child: SafeArea(
          child: GetX<HomeController>(
            builder: (_) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) => RecordRow(
                      videoModel: homeController.videosRefs[index],
                    ),
                    itemCount: homeController.videosRefs.length,
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
      ),
    );
  }
}
