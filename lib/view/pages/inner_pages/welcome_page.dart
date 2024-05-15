import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_button.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_question.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const routeName = '/welcome_page';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/welcome_image.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                width: size.width * 0.4,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: CustomTextWidget(
                    text: 'Welcome',
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                width: size.width * 0.52,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomTextWidget(
                    text: 'Fashion',
                    color: AppColors.mainColor.withOpacity(0.4),
                    fontSize: 30,
                  ),
                  const Spacer(),
                  CustomTextWidget(
                    text: 'Store',
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 30,
                  ),
                ]),
              ),
              CustomButtons(
                onPressed: () => Get.offNamed(Routes.logInPage),
                title: 'Get Started',
                colorButton: AppColors.mainColor.withOpacity(0.4),
                textColor: Colors.white.withOpacity(0.5),
                margin: EdgeInsets.only(
                  top: size.height * 0.25,
                  bottom: size.height * 0.06,
                ),
              ),
              AuthQuestion(
                question: 'Don`t have an account? ',
                pageTitle: 'Sign up',
                color: Colors.white.withOpacity(0.4),
                page: Routes.signUpPage,
                fontSize: size.height * 0.029,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
