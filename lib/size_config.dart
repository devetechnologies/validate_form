import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defatulSize = 0;
  static Orientation orientation = _mediaQueryData.orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

//get the proportionate height as per screen size
double getProportionatedScreenHeight(double inputHeight) {
  //double screenHeight = SizeConfig.screenHeight;
  //812 is the layout heigth that designer use
  return inputHeight;
 // return (inputHeight / 812.0) * screenHeight;
}

//get the proportionate width as per screen size
double getProportionatedScreenWidth(double inputWidth) {
 // double screenWidth = SizeConfig.screenWidth;
  //812 is the layout width that designer use
  return inputWidth;
  //return (inputWidth / 812.0) * screenWidth;
}
