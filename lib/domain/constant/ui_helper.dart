import 'package:flutter/material.dart';

class UiHelper {

  //custom Text method
  static customText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
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
}
