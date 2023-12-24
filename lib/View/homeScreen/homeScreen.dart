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
            margin:  const EdgeInsets.all(36.5),
            height: 42,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffa1c0e0),
                  offset: Offset(0,0),
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
                      hintText: '19'.tr,
                    )),
              ),
            ),
          ),
          CarouselSlider(
              items: const [
              Image(image: NetworkImage('https://as2.ftcdn.net/v2/jpg/01/18/42/59/1000_F_118425925_n2GZJR42P1ai0p3qYmNe375LCd6kQ9R4.jpg'),),
               Image(image: NetworkImage('https://media.cnn.com/api/v1/images/stellar/prod/150827130939-medicine-pills-capsules.jpg?q=x_4,y_220,h_1937,w_3442,c_crop/h_540,w_960/f_webp'),),
              // Image(image: NetworkImage('https://www.heart.org/-/media/Images/Health-Topics/Cardiac-Rehab/medicine-close-up.jpg'),),
              ],
              options:CarouselOptions(
                height: 138,
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
    builder: (HomeController controller)=>GestureDetector(
      onTap: () {},
      child: Container(
        width: 150,
        margin: EdgeInsets.all(16),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(13), boxShadow: [
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
              Image.asset(
                'assets/images/ibn sina.png',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ibn Sina',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text('Medication',
              style: Theme.of(context).textTheme.bodySmall,),
              Text('Damascus, Midan',
              style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
        ),
      ),
    ),
  );
}
