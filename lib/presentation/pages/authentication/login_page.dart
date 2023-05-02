import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/forget_password_page.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/register_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/input_field.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/row_icons.dart';
import 'package:tutor_flutter_app/presentation/widgets/login/text_widgets.dart';

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
    // todo: delete 2 lines below -> this is for developing
    // ***********************************
    emailTextController.text = 'phhai@ymail.com'; //"student@lettutor.com";
    // emailTextController.text = "student@lettutor.com";
    passwordTextController.text = '123456';
    // ***********************************

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
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  children: [
                    const TextHeader(text: "MEET YOUR NEW ENGLISH TUTORS"),
                    const TextSubheader(),
                    const SizedBox(
                      height: 16,
                    ),
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
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: PrimaryButton(
                          text: "Login",
                          onPressed: () => _handleLogin(context),
                        )),
                    TextLink(
                      text: "Forget Password?",
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
                        const Text("Not a member yet? "),
                        TextLink(
                          text: "Sign up",
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

    if (email.isEmpty || password.isEmpty) {
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
