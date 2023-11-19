import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController{
  bool Gg = true ;
  Icon secureOrNot = Icon(Icons.remove_red_eye)  ;
  void isSecure(){
    Gg=!Gg;
    secureOrNot = Gg ? Icon(Icons.remove_red_eye) :Icon(Icons.visibility_off);

    update();
   }
}