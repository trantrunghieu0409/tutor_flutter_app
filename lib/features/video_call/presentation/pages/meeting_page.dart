import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/previous_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class MeetingPage extends StatefulWidget {
  final String meetingUrl;
  const MeetingPage({Key? key, required this.meetingUrl}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    var controller = WebViewController.fromPlatformCreationParams(params)
      ..loadRequest(
        Uri.parse('https://${widget.meetingUrl}'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36");

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
      appBar: PreviousAppBar(
        callback: onClosePage,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
