import 'dart:developer';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:tutor_flutter_app/chatgpt/src/common/constants/constants.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';

class TtsPlayer {
  late FlutterTts flutterTts;

  Function onCompleted;
  Function onSpeaking;

  TtsPlayer({required this.onSpeaking, required this.onCompleted}) {
    initTts();
  }

  Language _language = Language.english;

  String? engine;

  double volume = 0.5;

  double pitch = 1.0;

  double rate = 0.5;

  bool isCurrentLanguageInstalled = false;

  String _newVoiceText = "";

  bool get isIOS => Platform.isIOS;

  bool get isAndroid => Platform.isAndroid;

  TTSState? _state;

  TTSState? get state => _state;

  String get content => _newVoiceText;

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    flutterTts.setStartHandler(() {
      log("Playing");
      _state = TTSState.isPlaying;
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        log("TTS Initialized");
      });
    }

    flutterTts.setCompletionHandler(() {
      log("Complete$_newVoiceText");
      _state = TTSState.isCompleted;
    });

    flutterTts.setPauseHandler(() {
      log("Paused");
      _state = TTSState.isPaused;
    });

    flutterTts.setContinueHandler(() {
      log("Continued");
      _state = TTSState.isResumed;
    });

    flutterTts.setErrorHandler((msg) {
      log("error: $msg");
      _state = TTSState.isCompleted;
    });
  }

  void setContent({required String content}) {
    _newVoiceText = content;
  }

  Future speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText.isNotEmpty) {
      onSpeaking();
      if (await flutterTts.speak(_newVoiceText) == 1) {
        onCompleted();
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setLanguage(_language.code);
    await flutterTts.setVoice({"name": "Karen", "locale": _language.code});
  }

  Future stop() async {
    if (await flutterTts.stop() == 1) {
      onCompleted();
      _state = TTSState.isCompleted;
    }
  }

  Future pause() async {
    if (await flutterTts.pause() == 1) {
      onCompleted();
      _state = TTSState.isPaused;
    }
  }

  void changeLanguage(Language language) {
    if (language == _language) return;
    _language = language;
    flutterTts.setLanguage(_language.code);
    flutterTts.setVoice({"name": "Karen", "locale": _language.code});
    if (isAndroid) {
      flutterTts
          .isLanguageInstalled(_language.code)
          .then((value) => isCurrentLanguageInstalled = (value as bool));
    }
  }

  bool get isPlaying => _state == TTSState.isPlaying;

  bool get isResumedOrPlaying =>
      [TTSState.isResumed, TTSState.isPlaying].contains(_state);

  bool get isPausedOrCompleted =>
      [TTSState.isPaused, TTSState.isCompleted].contains(_state);

  bool get isCompleted => TTSState.isCompleted == _state;
}
