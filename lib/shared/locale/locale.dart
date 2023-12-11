import 'package:get/get.dart';
class MyLocale implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    "ar" :{
     "1":"الصفحة الرئيسية",
     "2":"التصنيفات",
     "3":"الإعدادات",
      "4": "طلباتي",
      "5":"المفضلة",
      "6":"اختر اللغة!",
    },
    "en": {
      "1":"home",
      "2":"Categories",
      "3":"Settings",
      "4": "My Cart",
      "5":"My Favourite",
      "6":"Choose a Language",
    }
  };

}

