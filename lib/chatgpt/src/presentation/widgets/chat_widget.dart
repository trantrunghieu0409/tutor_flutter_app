import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/chatgpt/src/common/utils/image_utils.dart';
import 'package:tutor_flutter_app/chatgpt/src/domain/entities/message.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/helpers/tts_player.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/widgets/text_widget.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/injection/injector_config.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget(
      {super.key,
      required this.chatMessage,
      this.shouldAnimate = false,
      required this.language,
      required this.onTextGenerate});

  final Message chatMessage;
  final bool shouldAnimate;
  final Language language;
  final Function onTextGenerate;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late TtsPlayer ttsPlayer;

  bool isSpeaking = false;

  @override
  void initState() {
    if (widget.chatMessage.isChatGpt) {
      ttsPlayer = TtsPlayer(onSpeaking: () {
        setState(() {
          isSpeaking = true;
        });
      }, onCompleted: () {
        setState(() {
          isSpeaking = false;
        });
      });

      ttsPlayer.setContent(content: widget.chatMessage.content);
      if (widget.shouldAnimate &&
          InjectorConfig.resolve<SettingsController>().isAutoSpeakingEnabled) {
        ttsPlayer.speak();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.chatMessage.isChatGpt) {
      SettingsController settingsController =
          Injector.resolve<SettingsController>();
      ttsPlayer.changeLanguage(settingsController.language);
    }

    return Column(
      children: [
        Material(
          color: widget.chatMessage.isUser
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).cardColor,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                widget.chatMessage.isUser
                    ? ImageUtils.userIcon
                    : ImageUtils.gptIcon,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: widget.chatMessage.isUser
                      ? TextWidget(label: widget.chatMessage.content)
                      : widget.shouldAnimate
                          ? DefaultTextStyle(
                              style: Theme.of(context).textTheme.labelLarge!,
                              child: AnimatedTextKit(
                                pause: const Duration(milliseconds: 2000),
                                isRepeatingAnimation: false,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                onNext: widget.onTextGenerate(),
                                onTap: () {
                                  if (ttsPlayer.isResumedOrPlaying) {
                                    ttsPlayer.stop();
                                  }
                                },
                                animatedTexts: [
                                  TyperAnimatedText(
                                      widget.chatMessage.content.trim(),
                                      speed: const Duration(milliseconds: 60))
                                ],
                              ))
                          : TextWidget(
                              label: widget.chatMessage.content.trim())),
              widget.chatMessage.isChatGpt
                  ? AvatarGlow(
                      endRadius: 24,
                      animate: isSpeaking,
                      child: IconButton(
                          onPressed: () {
                            ttsPlayer.state == null
                                ? ttsPlayer.speak()
                                : ttsPlayer.isPausedOrCompleted
                                    ? ttsPlayer.speak()
                                    : ttsPlayer.pause();
                          },
                          icon: Icon(isSpeaking
                              ? Icons.stop_circle_outlined
                              : Icons.play_arrow)),
                    )
                  : const SizedBox.shrink()
            ]),
          ),
        )
      ],
    );
  }
}
