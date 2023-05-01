import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
      appBar: PreviousAppBar(callback: onClosePage),
      body: const Placeholder(),
    );
  }
}
