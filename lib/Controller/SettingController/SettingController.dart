
import 'package:get/get.dart';
import 'package:gg/Network/Dio/dioHelper.dart';
import 'package:gg/model/loginModel.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/constant.dart';

class SettingController extends GetxController{
  void logoutState(){
    DioHelper.logout(token: '${token}').then((value) {
      loginModel1 = LoginModel.fromJson(value);
      showToast(text: '${loginModel1!.message}', state: ToastStates.SUCCESS);
      token = loginModel1!.token;
    }).catchError((error){
      showToast(text: 'Something went wrong', state: ToastStates.ERROR);
    });
  }
  void updateUSerInfo(){
    DioHelper.postData(url: 'update', data: {});
  }
  }