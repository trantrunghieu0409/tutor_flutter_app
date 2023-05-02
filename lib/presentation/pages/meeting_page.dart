import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/core/utils/meeting_utils.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/avatar_info.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';

class MeetingPage extends ConsumerStatefulWidget {
  final String meetingUrl;
  const MeetingPage(
      {Key? key,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.meetingUrl,
      required this.tutorInfo})
      : super(key: key);

  final int startTimestamp;
  final int endTimestamp;
  final TutorInfoEntity tutorInfo;

  @override
  ConsumerState<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends ConsumerState<MeetingPage> {
  Timer? timer;

  late Duration remainTime = Duration.zero;
  late DateTime startTime;
  late DateTime endTime;

  bool isStarted = false;
  bool isEnded = false;

  // late UserEntity user;

  @override
  void initState() {
    super.initState();

    isStarted = false;
    isEnded = false;
    startTime = DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp);
    endTime = DateTime.fromMillisecondsSinceEpoch(widget.endTimestamp);
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _countDown());
  }

  @override
  void dispose() {
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onClosePage() => {Navigator.pop(context)};

    return SafeArea(
      child: Scaffold(
        appBar: PreviousAppBar(
          callback: onClosePage,
        ),
        body: Container(
          decoration: BoxDecoration(color: _getColor()),
          child: Padding(
            padding: const EdgeInsets.only(top: 72),
            child: Column(
              children: [
                Text(
                  isEnded
                      ? "Class ended"
                      : isStarted
                          ? "Class time"
                          : "Class will begin in",
                  style: CommonTextStyle.h1,
                ),
                Center(
                    child: Text(
                  DateTimeUtils.formatDuration(remainTime),
                  style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                const SizedBox(
                  height: 72,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 24,
                      ),
                      AvatarInfo(tutor: widget.tutorInfo),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Class time",
                              style: CommonTextStyle.h2Black,
                            ),
                            Text(
                              DateTimeUtils.formatTimeRangeDateTime(
                                  startTime, endTime),
                              style: CommonTextStyle.bodyBlack,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Student request",
                              style: CommonTextStyle.h2Black,
                            ),
                            Text(
                              widget.tutorInfo.studentRequest != null
                                  ? widget.tutorInfo.studentRequest!
                                  : "No request",
                              style: CommonTextStyle.bodyItalicBlack,
                              maxLines: 3,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Center(
                              child: isEnded
                                  ? PrimaryButton(
                                      text: "Return to homepage",
                                      onPressed: onClosePage,
                                      backgroundColor: Colors.redAccent,
                                    )
                                  : PrimaryButton(
                                      onPressed: () {
                                        _joinMeeting(widget.meetingUrl);
                                      },
                                      text: "Join meeting"),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _countDown() {
    setState(() {
      isStarted = startTime.compareTo(DateTime.now()) < 0;
      isEnded = endTime.compareTo(DateTime.now()) < 0;

      // todo: remove this line ( add this to test when join meeting )

      remainTime = isStarted
          ? DateTime.now().difference(startTime)
          : startTime.difference(DateTime.now());

      if (isEnded) {
        remainTime = Duration.zero;
        if (timer != null) timer!.cancel();
      }
    });
  }

  _getColor() {
    if (isEnded) return Colors.red;
    if (isStarted) return Colors.blue;
    return Colors.green;
  }

  _joinMeeting(String meetingUrl) async {
    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }

    log("URL: $meetingUrl");

    // Define meetings options here
    var options = JitsiMeetingOptions(
        room: MeetingUtils.getRoom(meetingUrl),
        serverURL: LettutorConfig.jitsiServerUrl,
        audioOnly: false,
        audioMuted: false,
        videoMuted: false,
        token: MeetingUtils.getToken(meetingUrl));
    // featureFlags: featureFlags);
    // webOptions: {
    //   "roomName": "${widget.tutorInfo.email}classroom",
    //   "width": "100%",
    //   "height": "100%",
    //   "enableWelcomePage": false,
    //   "chromeExtensionBanner": null,
    // });

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
    );
  }
}
