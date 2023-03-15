import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/meeting_utils.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';
import 'package:tutor_flutter_app/features/video_call/presentation/widgets/meeting_webview.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    var url = fetchInstantMeetingUrl("testroom");
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MeetingWebView(meetingUrl: url)));
          },
          child: const Text("Join meeting"),
        ),
      ),
    );
  }
}
