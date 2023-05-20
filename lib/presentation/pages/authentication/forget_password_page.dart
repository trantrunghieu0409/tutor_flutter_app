import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';

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
                  body: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    children: [
                      const TextHeader(text: "RESET PASSWORD"),
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
                                const Text(
                                  'Check your mailbox for a link to reset your password.',
                                  style: TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                const Text(
                                  'Enter the email address associated with your account.',
                                  style: TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                InputField(
                                  title: "Email",
                                  placeholder: "Your email",
                                  textController: emailTextController,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: PrimaryButton(
                                      text: "Reset Password",
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
                                    ? "Return to login"
                                    : "Already remember your password",
                              ))),
                    ],
                  ),
                ),
              ));
  }

  Future<void> _handleForgotPassword(BuildContext context) async {
    String email = emailTextController.text;

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
