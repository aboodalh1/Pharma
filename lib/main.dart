import 'package:flutter/material.dart';
import 'package:gg/Network/Dio/dioHelper.dart';
import 'package:get/get.dart';
import 'package:gg/View/MainScreen/secondScreen.dart';
import 'package:gg/shared/constant.dart';
import 'package:gg/shared/styles/Styles.dart';
import 'Network/Local/cacheHelper.dart';
import 'View/MainScreen/LoginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Widget ?widget;
  uId=CacheHelper.getData(key: 'uid');
  if(token!=null){
    widget=SecondPage();
  }
  else{
    widget=LoginScreen();
  }
  //bool? onBoarding=CacheHelper.getData(key: 'onBoarding');
  token=CacheHelper.getData(key: 'token');
    if(token !=null)
      widget=SecondPage();
    else widget= LoginScreen();

  runApp(MyApp(
    startWidget:widget ,
  ));
}
class MyApp extends StatelessWidget {
  Widget  ? startWidget;
  MyApp({super.key, this.startWidget});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
