import 'package:flutter/material.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:gg/Network/Local/cacheHelper.dart';
import 'package:gg/View/MainScreen/LoginScreen.dart';
import 'package:gg/View/categoriesScreen/catProducts.dart';
import 'package:gg/View/categoriesScreen/catagories.dart';
import 'package:gg/View/homeScreen/CompaniesScreen.dart';
import '../../shared/component/component.dart';
import '../../shared/constant.dart';
import '../cartScreen/CartScreen.dart';
import '../products/Porducts.dart';
import '../settingScreen/profile/profile.dart';

class SecondPage extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List <Widget> navBarScreen =
  [
    HomeScreen(),
    CatProducts(),
    ProfilePage(),
  ];
  List <String> navBarName =
      [
        "1".tr,
        "2".tr,
        "3".tr
      ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller)=>Scaffold(
        key: scaffoldKey,

        body: navBarScreen[controller.navBarIndex],
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.medical_services_sharp, size: 40),
                      radius: 35,
                      foregroundColor: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pharmacy Name",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultIconButton(
                    function: (){},
                    label: "label",
                    icon: Icon(Icons.home)),
                SizedBox(
                  height: 10,
                ),
                DefaultIconButton(
                    function: (){},
                    label: "My Cart",
                    icon: Icon(Icons.shopping_cart_rounded)),
                SizedBox(
                  height: 10,
                ),
                DefaultIconButton(
                    function: (){
                      Get.to(CartScreen());
                    },
                    label: "Settings",
                    icon: Icon(Icons.settings)),
                SizedBox(
                  height: 10,
                ),
                DefaultIconButton(
                    function: (){
                      Get.off(LoginScreen());
                      token = '';
                      CacheHelper.saveData(key: 'token', value: '');
                      showToast(text: 'You Logged out Successfully', state: ToastStates.SUCCESS);
                    },
                    label: "LogOut",
                    icon: Icon(Icons.arrow_back_sharp)),
                SizedBox(
                  height: 10,
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
        BottomNavigationBar(

              currentIndex: controller.navBarIndex,
                onTap: (index) {
                  controller.changeNavBar(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "1".tr),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: "2".tr),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "3".tr),
                ]
            ),


        ),
    );
  }
}
