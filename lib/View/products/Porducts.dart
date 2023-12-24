import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gg/Controller/HomeController.dart';
import 'package:gg/View/cartScreen/CartScreen.dart';
import 'package:gg/View/favoriteScreen/FavoriteScreen.dart';
import 'package:gg/model/productModel.dart';
import 'package:gg/shared/constant.dart';
import 'package:get/get.dart';
import 'package:gg/shared/styles/colors.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Icon favorite = Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  'assets/images/ibn sina.png',
                  height: 183,
                  width: 500,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: -50,
                  // negative value to make half of the container outside the image
                  left: 41,
                  right: 41,
                  child: Container(
                    width: 292,
                    height: 110, // height of the container
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffa1c0e0),
                          offset: Offset(0, 0),
                          blurRadius: 25,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: Text(
                            "Tamico",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'KFRSOSA',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                '${catModel!.classifications?[0].name}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.blue,
                          indent: 20,
                          endIndent: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -62,
                  // negative value to make half of the container outside the image
                  left: 35,
                  right: 41,
                  child: Image.asset(
                    'assets/images/person.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:30, horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white, // color of the circle
                        radius: 20, // radius of the circle
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.arrow_turn_up_left,
                            color: defaultColor,),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white, // color of the circle
                        radius: 20, // radius of the circle
                        child: IconButton(
                          icon: Icon(CupertinoIcons.cart, color: defaultColor), // icon
                          onPressed: () {
                            Get.to(CartScreen());
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        backgroundColor: Colors.white, // color of the circle
                        radius: 20, // radius of the circle
                        child: IconButton(
                          icon: Icon(Icons.favorite, color: defaultColor), // icon
                          onPressed: () {
                            Get.to(FavoriteScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 1000,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: productModel1!.post!.length,
                itemBuilder: (BuildContext context, index) {
                  return GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (HomeController controller) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffa1c0e0),
                              offset: Offset(0, 0),
                              blurRadius: 12,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${productModel1!.post?[index]!.medicine!.scientificName}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins')),
                                      IconButton(
                                        icon: list[index].isFavorite
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                        onPressed: () {
                                          setState(() {
                                            list[index].isFavorite =
                                                !list[index].isFavorite;
                                          });
                                          print(token);
                                          controller.addToFavorite(
                                              id: productModel1!
                                                  .post![index].id!
                                                  .toInt());
                                          controller.changeFavorite();
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                      '${productModel1!.post?[index]!.medicine!.company}',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Poppins')),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text(
                                      '${productModel1!.post?[index]!.dateOfEnd}',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Poppins')),
                                  Row(
                                    children: [
                                      Text(
                                        "${productModel1!.post?[index]!.price} S.P",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove,
                                          size: 12,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if(list[index].counter>0)
                                            list[index].counter--;
                                            //list[index].counter=controller.productCounter; list[index].price -= list[index].price;
                                          });
                                        },
                                      ),
                                      Text(list[index].counter.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              color: Colors.blue)),
                                      IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          size: 12,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            list[index].counter++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12,
                              ),
                              child: Container(
                                width: 153,
                                child: Column(
                                  children: [
                                    Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                          'assets/images/img.png',
                                        )),
                                    Row(
                                      children: [
                                        Text('Show more details',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Poppins')),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 10,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
