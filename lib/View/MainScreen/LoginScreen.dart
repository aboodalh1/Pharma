import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/RegisterScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "20".tr,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("21".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                    validator: (value){
                      if(!userController.text.isNum){

                        return "Enter you Number above";
                      }
                    },
                      hintText: '+963******'
                      , controller: userController),
                  SizedBox(
                    height: 20,
                  ),
                  Text("22".tr,
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){},
                      hintText: '+963******', controller: passwordController),
                  SizedBox(
                    height: 40,
                  ),
                  DefaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          controller.loginState(
                              phone: userController.text,
                              password: passwordController.text);
                        }
                      },
                      label: '25'.tr,
                      context: context),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    title: Text(
                      "23".tr,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      ),
                    ),
                    value: controller.checkBox,
                    onChanged: (value) {
                      controller.changeCheckBox();
                    },
                    side: BorderSide(),
                  ),
                  Text(
                    "24".tr,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "26".tr,
                        style: TextStyle(
                          color: defaultColor,
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        child: Text("27".tr,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: defaultColor,
                            )),
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
