import 'package:flutter/material.dart';
import '../../shared/component/component.dart';


class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics() ,
        itemBuilder: (context,index)=>catList(context),
        separatorBuilder:(context,index)=> dividerWidget(),
        itemCount: 10);
  }
}


Widget catList(context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Image(
        image: NetworkImage('https://wwwnc.cdc.gov/travel/images/travel-with-medicine.jpg'),
        fit: BoxFit.cover,
          height: 80,
        width: 80,
      ),
      SizedBox(width: 40,),
      Flexible(
        child: Text(
          'Cat Name',
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ),
      Spacer(),
      IconButton(onPressed: (){
      },
          icon: Icon(Icons.arrow_forward_ios))
    ],
  ),
);