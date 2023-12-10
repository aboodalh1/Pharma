import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/shared/constant.dart';

import '../../../Controller/DarkModeRadioButtonController/RadioButtonController.dart';


class DarkModeScreen extends StatelessWidget {
  final DarkModeRadioController radioController = Get.put(DarkModeRadioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode'),
      ),
      body: GetBuilder<DarkModeRadioController>(
    init: DarkModeRadioController(),
    builder: (DarkModeRadioController controller )=> Column(
          children: <Widget>[
            Obx(() => RadioListTile<String>(
              title: Text('Off',
              style: Theme.of(context).textTheme.bodyMedium),
              value: 'On',
              groupValue: radioController.selectedValue.value,
              onChanged: (value) {
                controller.selectOn();
                Get.changeTheme(ThemeData.light());
              },
            )),
            Obx(() =>  RadioListTile<String>(
                title: Text('On',
                  style: Theme.of(context).textTheme.bodyMedium,),
                value: 'Off',
                groupValue: radioController.selectedValue.value,
                onChanged: (value) {
                  controller.selectOff();
                  Get.changeTheme(ThemeData.dark());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
