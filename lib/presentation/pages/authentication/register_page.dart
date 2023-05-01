import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
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

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
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
                    padding: const EdgeInsets.all(40),
                    children: [
                      const TextHeader(),
                      const TextSubheader(),
                      InputField(
                        title: "EMAIL",
                        placeholder: "Your email",
                        textController: emailTextController,
                      ),
                      InputField(
                          title: "PASSWORD",
                          placeholder: "Your password",
                          isObsecure: true,
                          textController: passwordTextController),
                      InputField(
                          title: "RE-TYPE PASSWORD",
                          placeholder: "Your re-type password",
                          isObsecure: true,
                          textController: reTypePasswordTextController),
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
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                  minimumSize: const Size.fromHeight(48)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                  "Return to login page") //_handleLogin(context),
                              )),
                    ],
                  ),
                ),
              ));
  }

  Future<void> _handleRegister(BuildContext context) async {
    String email = emailTextController.text;
    String password = passwordTextController.text;
    String retypePassword = reTypePasswordTextController.text;

    if (email.isEmpty || password.isEmpty || retypePassword != password) {
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${autheticationValidator.failure?.error}'),
          backgroundColor: Colors.red.shade300,
        ));
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const TutorListPage()),
            (route) => false);
      }
    }
  }
}
