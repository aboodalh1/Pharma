import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/LangRadioController/LanguageRadioButtonController.dart';

import '../../../Controller/DarkModeRadioButtonController/RadioButtonController.dart';


class LanguageScreen extends StatelessWidget {
  final LanguageRadioController radioController = Get.put(LanguageRadioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("6".tr,),
      ),
      body: Column(
        children: <Widget>[
          Obx(() => RadioListTile<String>(
            title: Text('English',
            style: Theme.of(context).textTheme.bodyMedium,),
            value: 'On',
            groupValue: radioController.selectedValue.value,
            onChanged: (value) {
              radioController.selectOn();
            },
          )),
          Obx(() => RadioListTile<String>(
            title: Text('العربية',
              style: Theme.of(context).textTheme.bodyMedium,),
            value: 'Off',
            groupValue: radioController.selectedValue.value,
            onChanged: (value) {
              radioController.selectOff();
            },
          )),
        ],
      ),
    );
  }
}
