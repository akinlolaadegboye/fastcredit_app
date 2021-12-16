import 'package:flutter/material.dart';
// Class to declare app screen size
class ScreenSize{
  static width(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static height(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }
}