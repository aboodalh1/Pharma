import 'package:flutter/material.dart';
import '../../Controller/HomeController.dart';
import '../../model/productModel.dart';
import '../../shared/constant.dart';
import 'package:get/get.dart';
class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ID: 159GF'),
      ),
      body: ListView.builder(
        itemCount: productModel1!.post!.length,
        itemBuilder: (BuildContext context, index) {
          return GetBuilder<HomeController>(
            init: HomeController(),
            builder:(HomeController controller)=> Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${productModel1!.post?[index]!.medicine!.scientificName}', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                              IconButton(
                                icon: list[index].isFavorite? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    list[index].isFavorite = !list[index].isFavorite;
                                  });
                                  print(token);
                                  controller.addToFavorite(id: productModel1!.post![index].id!.toInt());
                                  controller.changeFavorite();
                                },
                              ),
                            ],
                          ),
                          Text('${productModel1!.post?[index]!.medicine!.company}', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                          SizedBox(height:11,),
                          Text('${productModel1!.post?[index]!.dateOfEnd}', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                          Row(
                            children: [
                              Text("${productModel1!.post?[index]!.price} S.P",style:TextStyle(color: Colors.blue,fontSize: 15) ,),
                              IconButton(
                                icon: Icon(Icons.remove,size:12,color: Colors.blue,),
                                onPressed: () {
                                  setState(() {
                                    list[index].counter--;
                                    //list[index].counter=controller.productCounter; list[index].price -= list[index].price;
                                  });

                                },
                              ),
                              Text(list[index].counter.toString(),
                                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins',color: Colors.blue)),
                              IconButton(icon: Icon(Icons.add,size:12,color: Colors.blue,),
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
                    Spacer(flex: 1,),
                    Padding(
                      padding:  EdgeInsets.only(top: 12,),
                      child: Container(width: 153,
                        child: Column(
                          children: [
                            Container(height: 80,width: 80,
                                child: Image.asset('assets/images/img.png',)),
                            Row(
                              children: [
                                Text('Show more details',style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                                IconButton(onPressed: (){},
                                    icon:Icon(Icons.arrow_forward_ios,size: 10,))],
                            ) ],
                        ),
                      ),
                    ),],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
