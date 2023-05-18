import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/result_dialog.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/forget_password_page.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/register_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/change_language.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/row_icons.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef LoginCallback = void Function()?;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  bool isLoading = false;

  late AutheticationValidator autheticationValidator;
  late AnimationController controller;

  @override
  void initState() {
    autheticationValidator = Injector.resolve<AutheticationValidator>();
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
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
    emailTextController.text = 'phhai@ymail.com';
    passwordTextController.text = '123456';
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Circular progress indicator',
              ),
            ),
          )
        : SafeArea(
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                floatingActionButton: const ChangeLanguageButton(),
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  children: [
                    TextHeader(text: AppLocalizations.of(context)!.login_title),
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
                      placeholder: AppLocalizations.of(context)!.your_password,
                      isObsecure: true,
                      textController: passwordTextController,
                      validate: () => passwordTextController.text.isNotEmpty,
                      errorText:
                          AppLocalizations.of(context)!.password_notempty,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: PrimaryButton(
                          text: AppLocalizations.of(context)!.login,
                          onPressed: () => _handleLogin(context),
                        )),
                    TextLink(
                      text: AppLocalizations.of(context)!.forget_password,
                      onClick: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordPage.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const RowIcons(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${AppLocalizations.of(context)!.not_member} "),
                        TextLink(
                          text: AppLocalizations.of(context)!.sign_up,
                          onClick: () {
                            Navigator.pushNamed(
                                context, RegisterPage.routeName);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> _handleLogin(BuildContext context) async {
    String email = emailTextController.text;
    String password = passwordTextController.text;

    if (!StringUtils.isValidEmail(email) || password.isEmpty) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    bool isSuccess = await autheticationValidator.login(email, password);

    if (context.mounted) {
      if (!isSuccess) {
        setState(() {
          isLoading = false;
        });
        if (autheticationValidator.failure?.error ==
            "Your account has not activated") {
          DialogHelpers.showSimpleResultDialog(
              context,
              AppLocalizations.of(context)!.not_activate_title,
              AppLocalizations.of(context)!.not_activate_desc);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: ${autheticationValidator.failure?.error}'),
            backgroundColor: Colors.red.shade300,
          ));
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const TutorListPage()),
            (route) => false);
      }
    }
  }
}
