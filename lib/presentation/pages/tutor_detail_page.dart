import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/pages/main_chat_page.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/video_player.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/booking_calendar.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/tutor_detail_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorDetailPage extends StatelessWidget {
  const TutorDetailPage({super.key});
  static const routeName = '/tutor-detail';

  @override
  Widget build(BuildContext context) {
    final tutor = ModalRoute.of(context)!.settings.arguments as TutorEntity;
    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
      appBar: PreviousAppBar(
        callback: onClosePage,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          VideoSection(link: tutor.video),
          TutorDetailCard(tutor: tutor),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.make_appointment,
              style: CommonTextStyle.h2Second,
            ),
          ),
          BookingCalendar(
            tutor: tutor,
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, MainChatPage.routeName);
        },
        backgroundColor: Colors.lightBlue,
        label: Text(AppLocalizations.of(context)!.chat),
        icon: const Icon(Icons.message_outlined),
      ),
    );
  }
}
