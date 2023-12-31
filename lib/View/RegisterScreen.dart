import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/MainScreen/LoginScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/styles/colors.dart';


class RegisterScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) => SingleChildScrollView(
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
                    "30".tr,
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
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text("12".tr, style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                    validator: (value){
                      if(nameController.text.isEmpty){
                        return "Enter your Username";
                      }
                    },
                      hintText: '12'.tr, controller: nameController,
                  height: 45,
                  width: 293,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("14".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                    validator: (value){
                      if(emailController.text.isEmpty){
                        return "Enter your Email";
                      }
                    },
                    hintText: '14'.tr, controller: emailController,
                    height: 45,
                    width: 293,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("13".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){
                        if(!phoneController.text.isNum){
                          return "Enter you Number above";
                        }
                      },
                      hintText: '+963******', controller: phoneController,
                      height: 45,
                      width: 293),
                  SizedBox(
                    height: 20,
                  ),
                  Text("22".tr, style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultShadowFormField(
                      validator: (value){
                        if(passwordController.text.isEmpty){
                          return "Passwotd mustn \'t be empty";
                        }
                      },
                      hintText: '********', controller: passwordController,
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
                        if(confirmPasswordController.text.isEmpty){
                          return "Passwotd mustn \'t be empty";
                        }
                      },
                      hintText: '********',
                      controller: confirmPasswordController,
                      height: 45,
                      width: 293),
                  SizedBox(
                    height: 40,
                  ),
                  DefaultButton(
                      function: () {
                        if(formKey.currentState!.validate()){
                        controller.registerState(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text
                        );
                        }},
                      label: '29'.tr,
                      context: context),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "28".tr,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                          style:
                              TextStyle(fontFamily: "Poppins", color: defaultColor),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '25'.tr,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: defaultColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
