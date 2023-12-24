import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/cartScreen/orderScreen.dart';
import 'package:gg/shared/component/component.dart';
import 'package:gg/shared/styles/colors.dart';

import '../../shared/constant.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetBuilder <HomeController>(
      init: HomeController(),
      builder: (HomeController controller)=>Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.shopping_cart_rounded),
              SizedBox(width: 10,),
              Text("4".tr),
            ],
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context , index)=> Container(
            margin: EdgeInsetsDirectional.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Column(
                  children: [
                    Text('Order ID'),
                    Text('gggg'),
                    Text("11/12/2023",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                    ),)
                  ],
                ),
                Spacer(),
                TextButton(
                  onPressed: (){
                    Get.to(OrderScreen());
                  },
                  child: Text('Show details',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: defaultColor
                  )),
                )
              ],
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>dividerWidget(),
          itemCount: 14,
        ),
      ),
    );
  }
}
