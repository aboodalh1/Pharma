import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/controller.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
class MainScreen extends StatelessWidget {
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
                GradientText(
                  "Log in to your account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                ), colors: [Colors.indigo, Colors.blue],),
                SizedBox(
                  height: 30,
                ),
                Text("Number",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.indigo, Colors.blue]),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  height: 50,
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Container(
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      side: BorderSide(),
                    ),
                    Text("Remember me",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 23,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      child: Text("Forget passwprd?",
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text("Saidaly ya Saidaly ya Saidalyyyyyy Baddy Dawa for her and for me! ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
