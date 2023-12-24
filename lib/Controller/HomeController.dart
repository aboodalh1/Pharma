import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/View/MainScreen/secondScreen.dart';
import 'package:gg/model/favoriteModel.dart';
import 'package:gg/model/loginModel.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/constant.dart';
import '../Network/Dio/dioHelper.dart';
import '../Network/Local/cacheHelper.dart';
import '../model/Productssss.dart';
import '../model/catModel.dart';


class HomeController extends GetxController {
  bool Gg = true;
  bool Gg1 = true;
  int count = 0;
  bool checkBox = false;
  int productCounter = 0;
  int navBarIndex = 0;
  Icon secureOrNot = Icon(Icons.remove_red_eye);
  Icon secureOrNot1 = Icon(Icons.remove_red_eye);
  Icon favorite = Icon(Icons.favorite_border);
  bool isFavorite= false;


  void isSecure() {
    Gg = !Gg;
    secureOrNot = Gg ? Icon(Icons.remove_red_eye) : Icon(Icons.visibility_off);
    update();
  }

  void isSecure1() {
    Gg1 = !Gg1;
    secureOrNot1 = Gg1 ? Icon(Icons.remove_red_eye) : Icon(Icons.visibility_off);
    update();
  }

  void changeCheckBox() {
    checkBox = !checkBox;
    update();
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

  void increaseCounter(){
    productCounter++;
    update();
  }

  void decreaseCounter(){
    if(productCounter ==0){return;}
    productCounter--;
    update();
  }

  void changeFavorite(){
    isFavorite =!isFavorite;
    favorite = isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
    update();
  }



  void registerState({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  })
  {
    DioHelper.postData(
        url: 'reg',
        data: {
          'name':name,
          'email':email,
          'phone':phone,
          'password':password,
          'password_confirmation':confirmPassword,
        }).then((value) async{
      loginModel1 = LoginModel.fromJson(value.data);
      print(loginModel1!.token);
      if(value.statusCode !=200) showToast(text: '${value.statusMessage}' , state: ToastStates.WARNING);
      else {showToast(text: '${loginModel1!.message}', state: ToastStates.SUCCESS);
      await DioHelper.getData(path: 'http://10.0.2.2:8000/api/Classifications').then((value) {
        catModel = CatModel.fromJson(value.data);
        print(catModel!.classifications?[0].name);
      });
      await DioHelper.getData(path: 'http://10.0.2.2:8000/api/po/1/c').then((value) {
        productModel1 = Productssss.fromJson(value.data);
        print(productModel1!.post?[0].medicine!.tradeName);

      });
      Get.off(SecondPage());}

    }).catchError((error){
      showToast(text: 'Something went wrong', state: ToastStates.ERROR);
    });
  }

  void loginState({required String phone, required String password}) {
    DioHelper.postData(url: 'login', data: {
      'phone': phone,
      'password': password,
    }).then((value) {
      loginModel1 = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: loginModel1!.token)
          .then((value) async{
        token = loginModel1!.token;
        print(token);
        await DioHelper.getData(path: 'http://10.0.2.2:8000/api/Classifications').then((value) {
          catModel = CatModel.fromJson(value.data);
          print(catModel!.classifications?[0].name);
        });
        await DioHelper.getData(path: 'http://10.0.2.2:8000/api/po/1/c').then((value) {
          productModel1 = Productssss.fromJson(value.data);
          print(productModel1!.post?[0].medicine!.tradeName);

        });
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

  void addToFavorite({
    required int id
  }){
    DioHelper.postDataWithAuth(
      url: 'medicine/$id/favorites',
      data: {
      },
      token: token,
    ).catchError((error){print(error.toString());});
  }
  void getFav(){
    DioHelper.getData(
        path: 'medicines/favorites',
        token: token
    ).then((value) {
      favoriteModel =FavoriteModel.fromJson(value.data);
    });
  }

}

