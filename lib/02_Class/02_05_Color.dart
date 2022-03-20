import 'package:flutter/cupertino.dart';

class ColorConfig {
  static late Color Black;
  static late Color Gray;
  static late Color White;
  static late Color Yellow;
  static late Color SkyBlue;
  static late Color Blue;
  static late Color Red;
  static late Color DarkGray;

  void init(BuildContext context) {
    //使用する色を定義
    Black = Color(0xFF212121);
    Gray = Color(0xFFC1C1C1);
    White = Color(0xFFFFFFFF);
    Yellow = Color(0xFFFFF38D);
    SkyBlue = Color(0x3212C2CD);
    Blue = Color(0xFF12C2CD);
    Red = Color(0xFFFF4949);
    DarkGray = Color(0xFFA3A3A3);
  }
}

Map<String,List<String>> map = {
  'FirstName':['りんご','ひめ'],
  'SecondName': ['りんご','ひめ']
};