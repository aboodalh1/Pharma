import 'package:flutter/cupertino.dart';
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
          Container(
            margin: const EdgeInsets.all(36.5),
            height: 42,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffa1c0e0),
                  offset: Offset(0, 0),
                  blurRadius: 25,
                )
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: 17.23,
                          bottom: 22,
                          right: 20,
                        ),
                        child: Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.grey,
                        ),
                      ),
                      label: Text('19'.tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    )),
              ),
            ),
          ),
          SizedBox(height: 10,),
          CarouselSlider(
              items: [
                Image.asset('assets/images/ad.png'),
                // Image(image: NetworkImage('https://www.heart.org/-/media/Images/Health-Topics/Cardiac-Rehab/medicine-close-up.jpg'),),
              ],
              options: CarouselOptions(
                height: 120,
                autoPlay: true,
                autoPlayAnimationDuration: (const Duration(seconds: 2)),
                reverse: false,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
              )),
           SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            childAspectRatio: 1.6 / 1.6,
            children: List.generate(6, (index) => productGridView(context)),
          ),
        ],
      ),
    );
  }

  Widget productGridView(context) =>
      GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) =>
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 150,
                margin: EdgeInsets.all(16),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(16), boxShadow: [
                  BoxShadow(
                    color: Color(0xffa1c0e0),
                    offset: Offset(0, 0),
                    blurRadius: 20,
                  )
                ]),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(12),
                                    topEnd: Radius.circular(12)),
                                child: Image.asset(
                                  'assets/images/ibn sina.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: -85,
                                // negative value to make half of the container outside the image
                                left: 61,
                                right: -45,
                                child: Image.asset('assets/images/person.png',
                                  scale: 2.5,)
                            ),
                            Positioned(
                              bottom: -25,
                              // negative value to make half of the container outside the image
                              left: 61,
                              right: -69,

                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 5,
                              ),
                            )
                          ]
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Ibn Sina',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                            SizedBox(height: 5,),
                            Text('Medication',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,),
                            SizedBox(height: 5,),
                            Text('Damascus, Midan',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      );
}
