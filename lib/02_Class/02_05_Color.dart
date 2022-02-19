import 'package:flutter/cupertino.dart';

class ColorConfig {
  static late Color Black;
  static late Color White;
  static late Color Yellow;
  static late Color Blue;

  void init(BuildContext context) {
    //使用する色を定義
    Black = Color(0xFF212121);
    White = Color(0xFFFFFFFF);
    Yellow = Color(0xFFFFF38D);
    Blue = Color(0xFF12C2CD);
  }
}