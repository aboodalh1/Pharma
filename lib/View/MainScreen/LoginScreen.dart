import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/RegisterScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/styles/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();

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
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "Log in to your account",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: defaultColor,
                    ),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Number", style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                    return 'Email must\'t be empty';
                      }
                      else return null;
                    },
                    controller: userController,
                    decoration: InputDecoration(
                      labelText: "Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Password", style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Password must\'t be empty';
                      }
                      else return null;
                    },
                    controller: passwordController,
                    obscureText: controller.Gg,
                    decoration: InputDecoration(
                      suffixIcon: MaterialButton(
                          onPressed: () {
                            controller.isSecure();
                          },
                          child: controller.secureOrNot),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  DefaultButton(
                      function: () {
                        if(formKey.currentState!.validate()){
                          controller.loginState(
                              phone: userController.text,
                              password: passwordController.text);
                        }
                      },
                      label: 'Log in',
                      context: context),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    title: Text(
                      "Remember me",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    value: controller.checkBox,
                    onChanged: (value) {
                      controller.changeCheckBox();
                    },
                    side: BorderSide(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?",
                      style: TextStyle(
                        color: defaultColor,
                        fontFamily: "Poppins",
                        fontSize: 18,
                      ),),
                      TextButton(
                        child: Text("Sign Up",
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
                  Text(
                    "Saidaly ya Saidaly ya Saidalyyyyyy Baddy Dawa for her and for me! ",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
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
