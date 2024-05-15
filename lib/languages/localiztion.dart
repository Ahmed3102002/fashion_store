import 'package:fashion_store/languages/ar.dart';
import 'package:fashion_store/languages/en.dart';
import 'package:fashion_store/languages/fr.dart';
import 'package:fashion_store/utils/costant_values.dart';
import 'package:get/route_manager.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ConstantValues.englishValue: en,
        ConstantValues.arabicValue: ar,
        ConstantValues.frenchValue: fr,
      };
}
