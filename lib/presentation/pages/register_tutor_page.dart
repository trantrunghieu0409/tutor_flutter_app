import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/data/models/request/become_tutor_req.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/level_enum.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/user_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/profile/profile_input_field.dart';

class RegisterTutorPage extends ConsumerStatefulWidget {
  const RegisterTutorPage({super.key});

  static const routeName = '/becometutor';

  @override
  ConsumerState<RegisterTutorPage> createState() => _RegisterTutorPageState();
}

class _RegisterTutorPageState extends ConsumerState<RegisterTutorPage> {
  late UserEntity user;
  late ImagePicker picker;
  bool isEditing = false;

  XFile? image;
  var nameController = TextEditingController();
  var introductionController = TextEditingController();
  var interestsController = TextEditingController();
  var educationController = TextEditingController();
  String? levelValue;

  @override
  void initState() {
    picker = ImagePicker();
    super.initState();
  }

  _setValueForController(TextEditingController controller, String value) {
    controller.text = value;
    controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.fromPosition(
        TextPosition(offset: value.length),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    onClosePage() => {Navigator.pop(context)};
    isLoading = ref.watch(userProvider.notifier).isLoading;
    final userEntity = ref.watch(userProvider);

    if (userEntity != null) {
      user = userEntity;
      _setValueForController(nameController, user.name);

      levelValue = user.level == null ? null : LevelEnum.getValue(user.level!);
    }

    return Scaffold(
      appBar: PreviousAppBar(callback: onClosePage),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                children: [
                  PageIntroduction(
                    title: "Tutor profile",
                    description:
                        "Your tutor profile is your chance to market yourself to students on Lettutor.\nNew students may browse tutor profiles to find a tutor that fits their learning goals.",
                    image: Image.asset(
                      ImageUtils.becomeTutordPath,
                      width: 140,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BorderContainer(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Stack(children: [
                                CircleAvatar(
                                  radius: 72,
                                  backgroundImage: _previewImage(),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(90.0),
                                            color: Colors.blue),
                                        child: IconButton(
                                          iconSize: 16,
                                          icon: const Icon(
                                            Icons.image,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            image = await picker.pickImage(
                                                source: ImageSource.gallery);
                                            setState(() {});
                                          },
                                        )))
                              ]),
                            ),
                          ),
                          _rowTextWithIcon(
                              "Basic info",
                              const Icon(
                                Icons.person,
                                size: 24,
                              )),
                          ProfileInputField(
                              title: "Tutoring name",
                              placeholder: "Your tutoring name",
                              textController: nameController),
                          _rowTextWithIcon(
                              "Education",
                              const FaIcon(
                                FontAwesomeIcons.school,
                                size: 16,
                              )),
                          ProfileInputField(
                              title: "Introduction",
                              placeholder:
                                  'Ex. I was a doctor for 35 years and can help you practice business or medical English. I also enjoy teaching beginners as I am very patient and always speak slowly and clearly.',
                              isMultiline: true,
                              textController: introductionController),
                          ProfileInputField(
                              title: "Interests",
                              placeholder:
                                  'Interests, hobbies, memorable life experiences',
                              isMultiline: true,
                              maxLength: 50,
                              textController: interestsController),
                          ProfileInputField(
                              title: "Education",
                              placeholder:
                                  'Ex. Bachelor of Arts in Cambridge University',
                              isMultiline: true,
                              maxLength: 50,
                              textController: educationController),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: PrimaryButton(
                                text: "Submit",
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  bool isSucess = await ref
                                      .watch(userProvider.notifier)
                                      .becomeTutor(BecomeTutorReq(
                                          avatar: image,
                                          name: nameController.text.isEmpty
                                              ? user.name
                                              : nameController.text,
                                          bio: introductionController.text,
                                          interests: interestsController.text,
                                          education: educationController.text));

                                  setState(() {
                                    isLoading = true;
                                  });

                                  if (isSucess) {
                                    if (context.mounted) {
                                      ref
                                          .watch(userProvider.notifier)
                                          .getUserInfo();
                                      Navigator.pop(context);
                                      SnackBarHelpers.showSnackBarSuccess(
                                          context,
                                          "Success! Please wait for approval");
                                    }
                                  } else {
                                    if (context.mounted) {
                                      SnackBarHelpers.showSnackBarFail(context,
                                          "Please check your information again");
                                    }
                                  }
                                }),
                          )
                        ]),
                  )
                ],
              )),
    );
  }

  _rowTextWithIcon(String text, Widget icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: CommonTextStyle.h2Black,
          ),
        ],
      ),
    );
  }

  _previewImage() {
    var currentUserImage = Image(image: user.getAvatar().image).image;
    if (image == null) return currentUserImage;

    return kIsWeb
        ? Image.network(image!.path).image
        : Image.file(
            File(image!.path),
            errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) =>
                const Center(child: Text('This image type is not supported')),
          ).image;
  }
}
