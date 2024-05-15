import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/auth_widgets/auth_another_way.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_button.dart';
import 'package:fashion_store/view/pages/auth_pages/custom_auth_page.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_question.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_or_divider.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/text_forms/auth_text_forms/custom_email_text_form.dart';
import 'package:fashion_store/view/widgets/text_forms/auth_text_forms/custom_password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static const routeName = '/log_in_page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    return CustomAuthPage(
      formKey: formKey,
      childern: [
        CustomTextWidget(
          text: 'LOG IN',
          fontSize: 30,
          color: color,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        EmailTextForm(
          emailController: _emailController,
          emailFocusNode: _emailFocusNode,
          passwordFocusNode: _passwordFocusNode,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        PasswordTextForm(
          passwordController: _passwordController,
          passwordFocusNode: _passwordFocusNode,
          authController: authController,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: () => Get.toNamed(Routes.forgetPasswordPage),
            child: CustomTextWidget(
              text: 'Forget Password?',
              textDecoration: TextDecoration.underline,
              fontSize: 20,
              color: color,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        GetBuilder<AuthController>(builder: (context) {
          return CustomButtons(
            colorButton: color,
            textColor: AppColors.mainColor,
            title: 'LOG IN',
            onPressed: () async {
              authController.getIsLoading;

              if (formKey.currentState!.validate()) {
                authController.logInToFirebase(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
                authController.getIsLoading;
              }
            },
          );
        }),
        SizedBox(
          height: size.height * 0.02,
        ),
        AuthQuestion(
          question: 'Don`t have an account? ',
          pageTitle: 'Sign up',
          fontSize: 22,
          page: Routes.signUpPage,
          color: color,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const CustomOrDivider(),
        SizedBox(
          height: size.height * 0.02,
        ),
        AuthAnotherWay(),
      ],
    );
  }
}
