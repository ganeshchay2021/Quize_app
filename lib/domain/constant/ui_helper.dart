import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiHelper {
  //custom Text method
  static customText(
      {required String text,
      double? fontSize,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      Color? color,
      double? height}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  //custom asset image
  static assetsImage(
      {required String image, BoxFit? boxFit, double? height, double? width}) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: boxFit,
    );
  }

  //custom toast msg
  static customToastMsg(
      {required String tostMsg,
      required Color color,
      ToastGravity? toastGravity,
      required,
      required Color textColor}) {
    return Fluttertoast.showToast(
      msg: tostMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
