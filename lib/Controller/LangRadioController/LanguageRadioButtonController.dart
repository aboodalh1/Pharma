import 'package:get/get.dart';

import '../../shared/locale/localController.dart';

class LanguageRadioController extends GetxController {
  LocalController controllerLang = Get.find();
  var selectedValue = 'On'.obs;

  void selectOn() {
    selectedValue.value = 'On';
    controllerLang.changeLang("en");
  }

  void selectOff() {
    selectedValue.value = 'Off';
    controllerLang.changeLang("ar");
  }
}
