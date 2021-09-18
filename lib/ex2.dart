import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:record_me/screens/home_screen/home_widgets/audio_recorder.dart';

import 'screens/home_screen/home_widgets/audio_player.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showPlayer = false;
  ap.AudioSource? audioSource;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: MyAudioPlayer(
                    source: audioSource!,
                    onDelete: () {
                      setState(() => showPlayer = false);
                    },
                  ),
                )
              : AudioRecorder(
                  onStop: (path) {
                    print('_MyAppState.build ');
                    // final upTask = await uploadFile(path);
                    // upTask.snapshot
                    // Fimber.i('upTasl= ${upTask}');
                    showPlayer = true;
                    setState(() {
                      print('_MyAppState.build ');
                      audioSource = ap.AudioSource.uri(Uri.parse(path));
                    });
                  },
                ),
        ),
      ),
    );
  }

  uploadFile(path) {}
}
