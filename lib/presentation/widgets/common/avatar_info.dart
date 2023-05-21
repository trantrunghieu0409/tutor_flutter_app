import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/pages/main_chat_page.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/nation_with_flag.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'button_icon_outline.dart';

class AvatarInfo extends StatelessWidget {
  const AvatarInfo({super.key, required this.tutor});

  final TutorInfoEntity tutor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SettingUtils.isLightTheme ? Colors.white : Colors.black12,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: tutor.getAvatar().image,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tutor.name,
                    style: CommonTextStyle.h2Second,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  NationWithFlag(
                    nation: tutor.country ?? "VN",
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
          ButtonIconOutline(
            labelText: AppLocalizations.of(context)!.inbox,
            icon: const Icon(Icons.message),
            callback: () {
              Navigator.pushNamed(context, MainChatPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
