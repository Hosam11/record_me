import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:record_me/constants/dimensions.dart';
import 'package:record_me/models/video_model.dart';
import 'package:record_me/screens/home_screen/home_widgets/audio_player.dart';

class RecordRow extends StatelessWidget {
  const RecordRow({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallDimens),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(mediumDimens),
          child: Column(
            children: [
              Text(videoModel.name),
              MyAudioPlayer(
                  source: ap.AudioSource.uri(
                Uri.parse(videoModel.url),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
