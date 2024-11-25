import 'package:get/get_navigation/get_navigation.dart';
import 'package:ican/core/Loction/translationsAr.dart';
import 'package:ican/core/Loction/translationsEn.dart';

class TranslationsApp implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {'en': TranslationsEn, 'ar': TranslationsAr};
}
