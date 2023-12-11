import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_cart_rounded),
            SizedBox(width: 10,),
            Text("4".tr),
          ],
        ),
      ),
      body: Center(),
    );
  }
}
