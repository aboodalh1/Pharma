import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/Network/Dio/dioHelper.dart';
import 'package:gg/View/MainScreen/LoginScreen.dart';
import 'package:gg/model/loginModel.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/constant.dart';
import '../../Network/Local/cacheHelper.dart';

class SettingController extends GetxController{
  var switchValue = false.obs;

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
    if (switchValue.value == true) {
      Get.changeTheme(ThemeData.dark());
      CacheHelper.saveData(key: 'darkMode', value: true);
    }
    if (switchValue.value == false){
      Get.changeTheme(ThemeData.light());
      CacheHelper.saveData(key: 'darkMode', value: false);
    }
    update();
  }

  void logoutState(){
    token = null;
    loginModel1 = null;
    Get.off(LoginScreen());
    showToast(text: 'Logout Successfully', state: ToastStates.SUCCESS);
    // DioHelper.logout(token: token!).then((value) {
    //   loginModel1 = LoginModel.fromJson(value);
    //   print(loginModel1!.token);
    //   // showToast(text: '${loginModel1!.message}', state: ToastStates.SUCCESS);
    //   print('GGG');
    //   Get.off(LoginScreen());
    // }).catchError((error){
    //   // showToast(text: 'Something went wrong', state: ToastStates.ERROR);
    //  print(error);
    // });
  }
  void updateUSerInfo(
      {
     required String name,
     required String email,
     required String phone,
     required String password,
}
      ){
    DioHelper.postDataWithAuth(url: 'update',
        token: token,
        data: {
        "name":name,
        "email":email,
        "phone":phone,
        "password":password,
        }).then((value){
          loginModel1 = LoginModel.fromJson(value.data);
          print(loginModel1!.user.toString());
          showToast(text: 'Edit done Successfully', state: ToastStates.SUCCESS);
    });

  }
  }