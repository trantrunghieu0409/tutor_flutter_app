import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/change_language.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = '/forgot';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with TickerProviderStateMixin {
  final emailTextController = TextEditingController();

  bool isLoading = false;

  late AutheticationValidator autheticationValidator;
  late AnimationController controller;

  @override
  void initState() {
    autheticationValidator = Injector.resolve<AutheticationValidator>();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isSentEmail = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                  floatingActionButton: const ChangeLanguageButton(),
                  body: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    children: [
                      TextHeader(
                          text: AppLocalizations.of(context)!.reset_password),
                      isSentEmail
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    ImageUtils.resetPasswordPath,
                                    width: 200,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .reset_success_desc,
                                  style: const TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.reset_desc,
                                  style: const TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                InputField(
                                  title: "Email",
                                  placeholder:
                                      AppLocalizations.of(context)!.your_email,
                                  textController: emailTextController,
                                  validate: () => StringUtils.isValidEmail(
                                      emailTextController.text),
                                  errorText: "Not a valid email format",
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: PrimaryButton(
                                      text: AppLocalizations.of(context)!
                                          .reset_password,
                                      onPressed: () =>
                                          _handleForgotPassword(context),
                                    )),
                              ],
                            ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(48)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                isSentEmail
                                    ? AppLocalizations.of(context)!.return_login
                                    : AppLocalizations.of(context)!
                                        .remember_account,
                              ))),
                    ],
                  ),
                ),
              ));
  }

  Future<void> _handleForgotPassword(BuildContext context) async {
    String email = emailTextController.text;

    if (!StringUtils.isValidEmail(email)) {
      return;
    }

    if (email.isEmpty) {
      SnackBarHelpers.showSnackBarFail(context, 'Error: Email cannot be empty');
      return;
    }

    setState(() {
      isLoading = true;
    });
    bool isSuccess = await autheticationValidator.forgotPassword(email);

    if (context.mounted) {
      if (!isSuccess) {
        setState(() {
          isLoading = false;
          isSentEmail = false;
        });
        SnackBarHelpers.showSnackBarFail(
            context, 'Error: ${autheticationValidator.failure?.error}');
      } else {
        setState(() {
          isLoading = false;
          isSentEmail = true;
        });
        SnackBarHelpers.showSnackBarSuccess(
            context, 'Send email successfully!');
      }
    }
  }
}
