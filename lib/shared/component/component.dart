import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
Widget DefaultIconButton(
        {required void Function() function,
        required String label,
        required Icon icon}) =>
    Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blueAccent,Colors.blue,Colors.indigoAccent],),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: function,
        child: Row(children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );

Widget dividerWidget() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.white30,
    );

Widget DefaultButton(
        {required void Function() function, required String label, context}) =>
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent,Colors.blue,Colors.indigoAccent]),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      height: 50,
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Container(
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            child: Text(
              "$label",
              style: Theme.of(context).textTheme.labelLarge,
            )),
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
})=>   Fluttertoast.showToast(
    msg: text ,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: chooseToastColor(state: state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
