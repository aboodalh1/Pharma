import 'package:get/get.dart';

class LanguageRadioController extends GetxController {
  var selectedValue = 'On'.obs;

  void selectOn() {
    selectedValue.value = 'On';
  }

  void selectOff() {
    selectedValue.value = 'Off';
  }
}
