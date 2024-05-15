import 'package:fashion_store/firebase_options.dart';
import 'package:fashion_store/languages/localiztion.dart';
import 'package:fashion_store/logic/controllers/themes_controller.dart';
import 'package:fashion_store/routes/app_routes.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/costant_values.dart';
import 'package:fashion_store/utils/themes/all_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale(ConstantValues.englishValue),
      fallbackLocale: const Locale(ConstantValues.englishValue),
      translations: LocaliztionApp(),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemesController().getThemeMode,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? Routes.mainPage
          : AppRoutes.initialRoute,
      getPages: AppRoutes.getPages,
    );
  }
}
