import 'package:flutter/material.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:gg/Controller/HomeController.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CarouselSlider(
              items: const [
              Image(image: NetworkImage('https://as2.ftcdn.net/v2/jpg/01/18/42/59/1000_F_118425925_n2GZJR42P1ai0p3qYmNe375LCd6kQ9R4.jpg'),),
               Image(image: NetworkImage('https://media.cnn.com/api/v1/images/stellar/prod/150827130939-medicine-pills-capsules.jpg?q=x_4,y_220,h_1937,w_3442,c_crop/h_540,w_960/f_webp'),),
              // Image(image: NetworkImage('https://www.heart.org/-/media/Images/Health-Topics/Cardiac-Rehab/medicine-close-up.jpg'),),
              ],
              options:CarouselOptions(
                height: 250,
                autoPlay: true,
                autoPlayAnimationDuration: (const Duration(seconds: 2)),
                reverse: false,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
              )),
          const SizedBox(height:10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            childAspectRatio: 1 / 1.6,
            children: List.generate(6, (index) => productGridView(context)),
          ),
        ],
      ),
    );
  }

  Widget productGridView(context) => GetBuilder<HomeController>(
    init: HomeController(),
    builder: (HomeController controller)=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
                width: double.infinity,
                height: 190,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'https://medlineplus.gov/images/Medicines.jpg'),
                ))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: const Text(
                  '25,000',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trade Name',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                         style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Text(
                        'Medical Name',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text("Expire for 2002",
                      style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: Icon(Icons.favorite_border,
                              color: Colors.white, size: 16))),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'count',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                     showDialog(context: context, builder: (context)=>AlertDialog(
                       title: const Text("what the quantity!"),
                       content: Container(
                         height: 50,
                         width: 50,
                         child: Row(
                           mainAxisAlignment:MainAxisAlignment.center ,
                           children: [
                             IconButton(onPressed: (){
                               controller.increaseCount();
                             }, icon: const CircleAvatar(
                                 backgroundColor: Colors.blueGrey,
                                 radius: 15,
                                 child: Icon(
                                   Icons.add,
                                   color: Colors.white,
                                   size: 14,
                                 )),),
                             Text('${controller.count}'),
                             IconButton(onPressed: (){
                               controller.decreaseCount();
                             }, icon: const CircleAvatar(
                                 backgroundColor: Colors.blueGrey,
                                 radius: 15,
                                 child: Icon(
                                   Icons.remove,
                                   color: Colors.white,
                                   size: 14,
                                 )),),
                           ],
                         ),
                       ),
                     ));
                    },
                    icon: const CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 15,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
