import 'package:get/get.dart';

import '../../shared/constant.dart';

class DarkModeRadioController extends GetxController {
  var selectedValue = 'On'.obs;

  void selectOn() {
    selectedValue.value = 'On';
    update();
  }

  void selectOff() {
    selectedValue.value = 'Off';
   update();
  }
}
