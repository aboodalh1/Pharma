import 'package:flutter/material.dart';
import 'package:gg/Network/Dio/dioHelper.dart';
import 'package:get/get.dart';
import 'package:gg/View/MainScreen/secondScreen.dart';
import 'package:gg/shared/constant.dart';
import 'package:gg/shared/locale/localController.dart';
import 'package:gg/shared/locale/locale.dart';
import 'package:gg/shared/styles/Styles.dart';
import 'Network/Local/cacheHelper.dart';
import 'View/MainScreen/LoginScreen.dart';
import 'model/Productssss.dart';
import 'model/catModel.dart';
import 'model/favoriteModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  late bool isDarkMode;

  token = CacheHelper.getData(key: 'token');

  if (token == null)
    widget = LoginScreen();
  else {
    widget = SecondPage();
    print('Second Page from the beginning');
    await DioHelper.getData(path: 'http://10.0.2.2:8000/api/Classifications')
        .then((value) {
      catModel = CatModel.fromJson(value.data);
      print(catModel!.classifications?[0].name);
    });
    await DioHelper.getData(path: 'http://10.0.2.2:8000/api/po/1/c')
        .then((value) {
      productModel1 = Productssss.fromJson(value.data);
      print(productModel1!.post?[0].medicine!.tradeName);
    });
    // if (loginModel1 != null && loginModel1!.user != null) {
    //   loginModel1!.user!.name = await CacheHelper.getData(key: 'username');
    //   loginModel1!.user!.phone = await CacheHelper.getData(key: 'phone');
    //   loginModel1!.user!.email = await CacheHelper.getData(key: 'email');
    // }
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;

  MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    return GetMaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: MyLocale(),
      home: startWidget,
    );
  }
}
