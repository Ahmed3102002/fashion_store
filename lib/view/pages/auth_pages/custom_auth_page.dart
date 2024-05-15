import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomAuthPage extends StatelessWidget {
  CustomAuthPage({
    super.key,
    required this.childern,
    this.appBar,
    required this.formKey,
  });

  final List<Widget> childern;
  final PreferredSizeWidget? appBar;
  final GlobalKey formKey;
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: ModalProgressHUD(
          color: AppColors.darkGreyClr,
          inAsyncCall: authController.getIsLoading,
          progressIndicator: const CircularProgressIndicator(
            color: Colors.white,
          ),
          child: Form(
            key: formKey,
            child: Scaffold(
              appBar: appBar,
              body: ListView(physics: const BouncingScrollPhysics(), children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.09,
                  child: const Center(
                    child: CustomTextWidget(
                      text: 'Fashion Store',
                      color: AppColors.mainColor,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(size.width * 0.015),
                  padding: EdgeInsets.all(size.width * 0.06),
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: childern,
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
