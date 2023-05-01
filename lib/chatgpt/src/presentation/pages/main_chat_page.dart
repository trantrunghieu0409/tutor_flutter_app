import 'dart:async';
import 'dart:math' hide log;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/providers/chat_notifier.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/widgets/chat_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';

class MainChatPage extends ConsumerStatefulWidget {
  const MainChatPage({super.key});

  static String routeName = '/chatGpt';

  @override
  ConsumerState<MainChatPage> createState() => _MainChatPageState();
}

class _MainChatPageState extends ConsumerState<MainChatPage> {
  bool _isTyping = false;
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  late FocusNode focusNode;

  bool _hasSpeech = false;
  final bool _logEvents = false;
  final bool _onDevice = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  final SpeechToText speech = SpeechToText();

  bool isFromLocal = true;

  @override
  void initState() {
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    initSpeechState();

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> initSpeechState() async {
    _logEvent('Initialize');
    try {
      _hasSpeech = true;
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: (status) => statusListener(status),
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        // _hasSpeech = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatsProvider);
    final settingsController = Injector.resolve<SettingsController>();

    onClosePage() => {Navigator.pop(context)};
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreviousAppBar(
          callback: onClosePage,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    chatMessage: messages[index],
                    shouldAnimate: !isFromLocal && messages.length - 1 == index,
                    language: settingsController.language,
                    onTextGenerate: () {
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut);
                    },
                  );
                },
              ),
            ),
            if (_isTyping) ...[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
            Material(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      focusNode: focusNode,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        if (speech.isNotListening) {
                          onSendMessage();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: speech.isNotListening
                            ? AppLocalizations.of(context)!.intro_input
                            : speech.isAvailable
                                ? AppLocalizations.of(context)!.listening
                                : 'Speech not available',
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    )),
                    IconButton(
                        onPressed: speech.isNotListening
                            ? !_hasSpeech || speech.isListening
                                ? null
                                : startListening
                            : speech.isListening
                                ? stopListening
                                : null,
                        icon: Icon(
                          speech.isNotListening
                              ? Icons.mic_rounded
                              : Icons.pause,
                        )),
                    if (speech.isListening)
                      IconButton(
                        onPressed: speech.isListening ? cancelListening : null,
                        icon: const Icon(
                          Icons.cancel,
                        ),
                      ),
                    if (speech.isNotListening)
                      IconButton(
                          onPressed: () async => onSendMessage(),
                          icon: const Icon(
                            Icons.send,
                          ))
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<void> onSendMessage() async {
    try {
      String message = textEditingController.text;
      setState(() {
        _isTyping = true;
        textEditingController.clear();
        focusNode.unfocus();
        isFromLocal = false;
      });
      await ref.watch(chatsProvider.notifier).add(message);
    } finally {
      setState(() {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        _isTyping = false;
      });
    }
  }

  // This is called each time the users wants to start a new speech
  // recognition session
  void startListening() {
    _logEvent('start listening');
    lastWords = '';
    lastError = '';

    speech.listen(
      onResult: resultListener,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 10),
      partialResults: true,
      localeId: _currentLocaleId,
      onSoundLevelChange: soundLevelListener,
      cancelOnError: true,
      listenMode: ListenMode.confirmation,
      onDevice: _onDevice,
    );
    setState(() {
      textEditingController.clear();
    });
  }

  void stopListening() {
    _logEvent('stop');
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    _logEvent('cancel');
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
      textEditingController.text = result.recognizedWords;
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    //_logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = status;
    });
  }

  void _logEvent(String eventDescription) {
    //if (_logEvents) {
    var eventTime = DateTime.now().toIso8601String();
    log('$eventTime $eventDescription');
    // }
  }
}
