import 'package:flutter/material.dart';
import 'Grid.dart';
import 'package:get/get.dart';

class Catagories extends StatelessWidget {
  Catagories({super.key});

  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(36.5),
              child: Container(
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
                          hintText: '18'.tr,
                        )),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: Color(0xff3366CCF),
                      fontSize: 40,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  width: double.infinity,
                  height: 640,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: gridsList.length-2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return Cate(index);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
