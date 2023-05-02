import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/user_entity.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/user_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:tutor_flutter_app/presentation/widgets/profile/user_editing_widget.dart';
import 'package:tutor_flutter_app/presentation/widgets/profile/user_readonly_widget.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late UserEntity user;
  late ImagePicker picker;
  bool isEditing = false;

  XFile? image;

  @override
  void initState() {
    picker = ImagePicker();
    super.initState();
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
    }

    return Scaffold(
      appBar: PreviousAppBar(callback: onClosePage),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.blue, Colors.white])),
                child: ListView(
                  padding: const EdgeInsets.only(top: 32),
                  children: [
                    Center(
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: _previewImage(),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(90.0),
                                  color: Colors.blue),
                              child: isEditing
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        image = await picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {});
                                      },
                                    )
                                  : IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isEditing = true;
                                        });
                                      },
                                    ),
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              user.name,
                              style: CommonTextStyle.h1,
                            ),
                            Text(
                              user.email,
                              style: CommonTextStyle.body,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: !isEditing
                              ? UserReadonlyWidget(
                                  user: user,
                                )
                              : UserEditingWidget(
                                  user: user,
                                  callback:
                                      (name, studySchedule, levelValue) async {
                                    Future<bool> isUploadSuccess = ref
                                        .watch(userProvider.notifier)
                                        .uploadAvatar(image);

                                    Future<bool> isUpdateInfoSuccess = ref
                                        .watch(userProvider.notifier)
                                        .updateUserInfo(
                                            name, studySchedule, levelValue);
                                    await isUploadSuccess &&
                                            await isUpdateInfoSuccess
                                        ? _onUpdateSuccess()
                                        : _onUpdateFail();

                                    ref
                                        .watch(userProvider.notifier)
                                        .getUserInfo();
                                        
                                    setState(() {
                                      image = null;
                                      isEditing = false;
                                    });
                                  },
                                )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  _onUpdateSuccess() {
    SnackBarHelpers.showSnackBarSuccess(context, 'Update successful!');
  }

  _onUpdateFail() {
    SnackBarHelpers.showSnackBarSuccess(context, 'Update fail!');
  }

  _previewImage() {
    var currentUserImage = Image(image: user.getAvatar().image).image;
    if (!isEditing || image == null) return currentUserImage;

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
