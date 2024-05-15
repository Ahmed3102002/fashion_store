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
import 'package:fashion_store/view/widgets/text_forms/auth_text_forms/custom_name_text_form.dart';
import 'package:fashion_store/view/widgets/text_forms/auth_text_forms/custom_password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const routeName = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
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
          text: 'SIGN UP',
          fontSize: 30,
          color: color,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        NameTextForm(
          nameController: _nameController,
          nameFocusNode: _nameFocusNode,
          emailFocusNode: _emailFocusNode,
        ),
        SizedBox(
          height: size.height * 0.02,
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
        SizedBox(
          height: size.height * 0.02,
        ),
        GetBuilder<AuthController>(builder: (context) {
          return CustomButtons(
            colorButton: color,
            textColor: AppColors.mainColor,
            title: 'SIGN UP',
            onPressed: () {
              try {
                authController.setIsLoading;
                if (formKey.currentState!.validate()) {
                  authController.signUpToFirebase(
                      name: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim());
                }
                authController.setIsLoading;
              } catch (e) {
                authController.setIsLoading;
                Get.snackbar(
                  snackPosition: SnackPosition.BOTTOM,
                  e.toString(),
                  e.toString(),
                  backgroundColor: AppColors.mainColor,
                  colorText: Colors.white,
                  borderRadius: 20,
                );
              }
            },
          );
        }),
        SizedBox(
          height: size.height * 0.01,
        ),
        AuthQuestion(
          color: color,
          question: 'I have an account ,',
          pageTitle: 'Log in',
          fontSize: 22,
          page: Routes.logInPage,
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
