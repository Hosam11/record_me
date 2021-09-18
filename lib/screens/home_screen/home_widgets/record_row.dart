import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:record_me/constants/dimensions.dart';
import 'package:record_me/screens/home_screen/home_widgets/audio_player.dart';

class RecordRow extends StatelessWidget {
  RecordRow({Key? key, required this.audioName, required this.audioSource})
      : super(key: key);
  final String audioName;
  final ap.AudioSource audioSource;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallDimens),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(mediumDimens),
          child: Column(
            children: [
              Text(audioName),
              MyAudioPlayer(source: audioSource),
            ],
          ),
        ),
      ),
    );
  }
}
