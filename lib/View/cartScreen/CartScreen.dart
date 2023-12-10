import 'package:flutter/material.dart';

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
            Text('My Cart'),
          ],
        ),
      ),
      body: Center(),
    );
  }
}
