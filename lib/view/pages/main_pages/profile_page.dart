import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/profile_widgets/languages.dart';
import 'package:fashion_store/view/widgets/profile_widgets/log_out_button.dart';
import 'package:fashion_store/view/widgets/profile_widgets/themes_button.dart';
import 'package:fashion_store/view/widgets/profile_widgets/user_data.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const routeName = '/profile_page';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserData(),
          const Divider(
            color: AppColors.pinkClr,
          ),
          const CustomTextWidget(text: 'GENERAL'),
          ThemesButton(),
          Languages(),
          LogOutButton(),
        ],
      ),
    );
  }
}
