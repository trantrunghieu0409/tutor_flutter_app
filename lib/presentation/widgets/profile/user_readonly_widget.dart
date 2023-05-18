import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/level_enum.dart';
import 'package:tutor_flutter_app/presentation/pages/register_tutor_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserReadonlyWidget extends StatelessWidget {
  const UserReadonlyWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.birthday,
          style: CommonTextStyle.h2Second,
        ),
        Text(user.birthday ?? AppLocalizations.of(context)!.no_data),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppLocalizations.of(context)!.phone,
          style: CommonTextStyle.h2Second,
        ),
        Text(user.phone),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppLocalizations.of(context)!.level,
          style: CommonTextStyle.h2Second,
        ),
        Text(LevelEnum.getValue(user.level ?? AppLocalizations.of(context)!.no_data)),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppLocalizations.of(context)!.study,
          maxLines: 3,
          style: CommonTextStyle.h2Second,
        ),
        Text(user.studySchedule ?? AppLocalizations.of(context)!.no_data),
        const SizedBox(
          height: 16,
        ),
        if (user.tutorInfo != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.tutor_info,
                maxLines: 3,
                style: CommonTextStyle.h2Second,
              ),
              Text(AppLocalizations.of(context)!.wait_approve),
            ],
          )
        else
          PrimaryButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, RegisterTutorPage.routeName);
            },
            text: "Become a tutor",
          ),
      ],
    );
  }
}
