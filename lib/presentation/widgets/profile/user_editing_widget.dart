import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/level_enum.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/profile/profile_input_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserEditingWidget extends StatefulWidget {
  const UserEditingWidget({super.key, required this.user, this.callback});

  final void Function(String name, String studySchedule, String levelValue)?
      callback;

  final UserEntity user;

  @override
  State<UserEditingWidget> createState() => _UserEditingWidgetState();
}

class _UserEditingWidgetState extends State<UserEditingWidget> {
  var nameController = TextEditingController();
  var studyScheduleController = TextEditingController();
  String? levelValue;

  @override
  void initState() {
    nameController.text = widget.user.name;
    nameController.value = TextEditingValue(
      text: widget.user.name,
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.user.name.length),
      ),
    );

    String studySchedule =
        widget.user.studySchedule ?? AppLocalizations.of(context)!.no_data;
    studyScheduleController.text = studySchedule;
    studyScheduleController.value = TextEditingValue(
      text: studySchedule,
      selection: TextSelection.fromPosition(
        TextPosition(offset: studySchedule.length),
      ),
    );

    levelValue = widget.user.level == null
        ? null
        : LevelEnum.getValue(widget.user.level!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInputField(
            title: AppLocalizations.of(context)!.name,
            placeholder: AppLocalizations.of(context)!.your_name,
            textController: nameController),
        ProfileInputField(
            title: AppLocalizations.of(context)!.study,
            placeholder: AppLocalizations.of(context)!.your_study,
            textController: studyScheduleController),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.level,
                style: CommonTextStyle.h3Second,
              ),
              CustomDropdownButton(
                  items: LevelEnum.values.map((e) => e.value).toList(),
                  hintText: AppLocalizations.of(context)!.your_level,
                  keepState: true,
                  selectedValue: levelValue,
                  callback: (String? value) {
                    levelValue = value;
                  }),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryButton(
            text: AppLocalizations.of(context)!.save,
            onPressed: () {
              if (widget.callback != null) {
                widget.callback!(
                    nameController.text,
                    studyScheduleController.text,
                    levelValue ??
                        LevelEnum.getValue(
                            widget.user.level ?? LevelEnum.BEGINNER.value));
              }
            })
      ],
    );
  }
}
