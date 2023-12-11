import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/MainScreen/LoginScreen.dart';
import 'package:gg/View/MainScreen/secondScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/styles/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegisterScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmpasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  "Sign Up your account",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: defaultColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text("Name",
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Username must\'t be empty';
                    }
                    else return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Number",
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Number must\'t be empty';
                    }
                    else return null;
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Enter your Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password",
                    style: Theme.of(context).textTheme.labelLarge),
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
                          controller.isSecure();},
                        child: controller.secureOrNot),
                    labelText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Confirm your password",
                    style: Theme.of(context).textTheme.labelLarge),
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
                  controller: ConfirmpasswordController,
                  obscureText: controller.Gg1,
                  decoration: InputDecoration(
                    suffixIcon: MaterialButton(
                        onPressed: () {
                          controller.isSecure1();},
                        child: controller.secureOrNot1),
                    labelText: 'Confirm your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(height: 30,),
                DefaultButton(function: (){
                    controller.registerState(
                      name: nameController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                    );
                },
                    label: 'Register',
                    context: context),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: defaultColor),),
                    TextButton(
                       child: Text('Log In',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: defaultColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                       ),
                      onPressed:(){Get.to(LoginScreen());} ,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
