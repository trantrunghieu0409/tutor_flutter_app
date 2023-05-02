import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/level_enum.dart';
import 'package:tutor_flutter_app/presentation/pages/register_tutor_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';

class UserReadonlyWidget extends StatelessWidget {
  const UserReadonlyWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Birthday",
          style: CommonTextStyle.h2Black,
        ),
        Text(user.birthday ?? "No data"),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Phone number",
          style: CommonTextStyle.h2Black,
        ),
        Text(user.phone),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Level",
          style: CommonTextStyle.h2Black,
        ),
        Text(LevelEnum.getValue(user.level ?? "No data")),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Study schedule",
          maxLines: 3,
          style: CommonTextStyle.h2Black,
        ),
        Text(user.studySchedule ?? "None"),
        const SizedBox(
          height: 16,
        ),
        if (user.tutorInfo != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tutor info",
                maxLines: 3,
                style: CommonTextStyle.h2Black,
              ),
              Text("Waiting for approval"),
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
