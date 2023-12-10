import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/View/MainScreen/secondScreen.dart';
import 'package:gg/model/loginModel.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/constant.dart';
import '../Network/Dio/dioHelper.dart';
import '../Network/Local/cacheHelper.dart';

class HomeController extends GetxController {
  bool Gg = true;
  int count = 0;
  bool checkBox = false;

  int navBarIndex = 0;
  Icon secureOrNot = Icon(Icons.remove_red_eye);

  void isSecure() {
    Gg = !Gg;
    secureOrNot = Gg ? Icon(Icons.remove_red_eye) : Icon(Icons.visibility_off);
    update();
  }

  void changeCheckBox() {
    checkBox = !checkBox;
    update();
  }

  void loginState({required String phone, required String password}) {
    DioHelper.postData(url: 'login', data: {
      'phone': phone,
      'password': password,
    }).then((value) {
      loginModel1 = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: loginModel1!.token)
          .then((value) {
        token = loginModel1!.token;
        print(token);
        if (token != null) {
          showToast(
          text: '${loginModel1!.message}', state: ToastStates.SUCCESS);
          Get.to(SecondPage());
        }
      });
      update();
    }).catchError((error) {
      if (error is DioException) {
        if (error.response?.statusCode == 403) {
          loginModel1!.message = "Invalid email or password";
          showToast(text: '${loginModel1!.message}', state: ToastStates.ERROR);
        } else {
          print(error.toString());
        }
      } else {
        print(error.toString());
      }
    });
  }

  changeNavBar(int index) {
    navBarIndex = index;
    update();
  }

  void increaseCount() {
    count++;
    update();
  }

  void decreaseCount() {
    count--;
    update();
  }

  void registerState({
    required String name,
    required String password,
    required String phone,
  })
  {
    DioHelper.postData(
        url: 'reg',
        data: {
          'name':'$name',
          'phone':'$phone',
          'password':'$password'
        }).then((value) {
          loginModel1 = LoginModel.fromJson(value.data);
          print(loginModel1!.token);
          showToast(text: '${loginModel1!.message}', state: ToastStates.SUCCESS);
          Get.off(SecondPage());

    }).catchError((error){
      showToast(text: 'Something went wrong', state: ToastStates.ERROR);
    });

  }
}
