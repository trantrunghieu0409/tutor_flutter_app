import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/string_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/snackbar_helpers.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';

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
                  body: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    children: [
                      const TextHeader(text: "START TODAY"),
                      const TextSubheader(),
                      const SizedBox(
                        height: 16,
                      ),
                      InputField(
                        title: "Email",
                        placeholder: "Your email",
                        textController: emailTextController,
                        validate: () =>
                            StringUtils.isValidEmail(emailTextController.text),
                        errorText: "Not a valid email format",
                      ),
                      InputField(
                        title: "Password",
                        placeholder: "Your password",
                        isObsecure: true,
                        textController: passwordTextController,
                        validate: () => passwordTextController.text.isNotEmpty,
                        errorText: "Password cannot be empty",
                      ),
                      InputField(
                          title: "Re-type password",
                          placeholder: "Your re-type password",
                          isObsecure: true,
                          textController: reTypePasswordTextController,
                          validate: () =>
                              reTypePasswordTextController.text ==
                              passwordTextController.text,
                          errorText: "Retype-Password does not match password"),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: PrimaryButton(
                            text: "Register",
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
                              child: const Text(
                                "Already have an account",
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
          context, 'Error: Re-type password must match password');
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
