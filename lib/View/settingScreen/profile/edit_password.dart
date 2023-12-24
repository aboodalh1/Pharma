import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/MainScreen/LoginScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/constant.dart';
import 'package:gg/shared/styles/colors.dart';

import '../../../Controller/SettingController/SettingController.dart';


class EditPassword extends StatelessWidget {

  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Scaffold(
        body: GetBuilder<SettingController>(
          init: SettingController(),
          builder: (SettingController controller) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "10".tr,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: defaultColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("15".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){
                        if(!oldPasswordController.text.isNum){
                          return "Enter you email above";
                        }
                      },
                      hintText: '15'.tr, controller: oldPasswordController,
                      height: 45,
                      width: 293),
                  SizedBox(
                    height: 20,
                  ),
                  Text("15".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){
                        if(oldPasswordController.text.isEmpty){
                          return "Passwotd mustn \'t be empty";
                        }
                      },
                      hintText: '********', controller: newPasswordController,
                      height: 45,
                      width: 293),
                  SizedBox(
                    height: 20,
                  ),
                  Text("16".tr,
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){
                        if(confirmNewPasswordController.text.isEmpty){
                          return "please enter your password to Confirm Edit";
                        }
                      },
                      hintText: '********',
                      controller: confirmNewPasswordController,
                      height: 45,
                      width: 293),
                  SizedBox(
                    height: 40,
                  ),
                  DefaultButton(
                      function: () {
                        if(formKey.currentState!.validate()){
                        }},
                      label: '17'.tr,
                      context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
