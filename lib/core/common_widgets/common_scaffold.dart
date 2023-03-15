import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_drawer.dart';

class CommonScaffold extends StatelessWidget {
  CommonScaffold({super.key, required this.child});

  final Widget child;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(callback: () {
        _scaffoldKey.currentState!.openDrawer();
      }),
      body: child,
      drawer: const CommonDrawer(),
    );
  }
}
