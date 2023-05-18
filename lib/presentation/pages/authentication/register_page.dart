import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/change_language.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef LoginCallback = void Function()?;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final reTypePasswordTextController = TextEditingController();

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
                          text: AppLocalizations.of(context)!.singup_title),
                      const TextSubheader(),
                      const SizedBox(
                        height: 16,
                      ),
                      InputField(
                        title: "Email",
                        placeholder: AppLocalizations.of(context)!.your_email,
                        textController: emailTextController,
                        validate: () =>
                            StringUtils.isValidEmail(emailTextController.text),
                        errorText: AppLocalizations.of(context)!.invalid_email,
                      ),
                      InputField(
                        title: AppLocalizations.of(context)!.password,
                        placeholder:
                            AppLocalizations.of(context)!.your_password,
                        isObsecure: true,
                        textController: passwordTextController,
                        validate: () => passwordTextController.text.isNotEmpty,
                        errorText:
                            AppLocalizations.of(context)!.password_notempty,
                      ),
                      InputField(
                          title: AppLocalizations.of(context)!.retype_password,
                          placeholder: AppLocalizations.of(context)!
                              .your_retype_password,
                          isObsecure: true,
                          textController: reTypePasswordTextController,
                          validate: () =>
                              reTypePasswordTextController.text ==
                              passwordTextController.text,
                          errorText:
                              AppLocalizations.of(context)!.retype_notmatch),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: PrimaryButton(
                            text: AppLocalizations.of(context)!.register,
                            onPressed: () => _handleRegister(context),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(48)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                AppLocalizations.of(context)!.have_account,
                              ))),
                    ],
                  ),
                ),
              ));
  }

  Future<void> _handleRegister(BuildContext context) async {
    String email = emailTextController.text;
    String password = passwordTextController.text;
    String retypePassword = reTypePasswordTextController.text;

    if (retypePassword != password) {
      SnackBarHelpers.showSnackBarFail(
          context, 'Error: ${AppLocalizations.of(context)!.retype_notmatch}');
    }

    if (!StringUtils.isValidEmail(email) ||
        password.isEmpty ||
        retypePassword != password) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    bool isSuccess = await autheticationValidator.register(email, password);

    if (context.mounted) {
      if (!isSuccess) {
        setState(() {
          isLoading = false;
        });
        SnackBarHelpers.showSnackBarFail(
            context, 'Error: ${autheticationValidator.failure?.error}');
      } else {
        SnackBarHelpers.showSnackBarSuccess(context, 'Register successfully!');
        Navigator.of(context).pop();
      }
    }
  }
}
