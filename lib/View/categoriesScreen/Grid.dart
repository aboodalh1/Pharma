import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gg/shared/constant.dart';

class Cate extends StatelessWidget {
  Cate(
    this.index, {
    Key? key,
  });

  int? index;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 170,
        width: 170,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                gridsList[index!].pic!,
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${catModel!.classifications?[index!].name}',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );

  }
}
List<Grids> gridsList = [
  Grids(
    id: 0,
    pic: 'assets/images/img.png',
    catName: 'Mediction',
  ),
  Grids(
    id: 1,
    pic: 'assets/images/img_1.png',
    catName: 'babies',
  ),
  Grids(
    id: 2,
    pic: 'assets/images/img_2.png',
    catName: 'Medical Devices',
  ),
  Grids(
    id: 3,
    pic: 'assets/images/img_3.png',
    catName: 'Teeth',
  ),
  Grids(
    id: 4,
    pic: 'assets/images/img_4.png',
    catName: 'Hair Care',
  ),
  Grids(
    id: 5,
    pic: 'assets/images/img_5.png',
    catName: 'Skin Care',
  ),
];
class Grids{
  int? id;
  String? pic;
  String? catName;

  Grids({required this.id,required this.pic,required this.catName}
      );

}


