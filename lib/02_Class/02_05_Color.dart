import 'package:flutter/cupertino.dart';

class ColorConfig {
  static late Color Black;
  static late Color WeakBlack;
  static late Color Gray;
  static late Color White;
  static late Color Yellow;
  static late Color SkyBlue;
  static late Color Blue;
  static late Color Red;
  static late Color PinkRed;
  static late Color WeakGray;
  static late Color StrongGray;
  static late Color Green;
  static late Color WeakGreen;
  static late Color WakamonoGreen;

  void init(BuildContext context) {
    //使用する色を定義
    Black = Color(0xFF212121);
    WeakBlack = Color(0x80212121);
    Gray = Color(0xFFC1C1C1);
    White = Color(0xFFFFFFFF);
    Yellow = Color(0xFFFFF38D);
    SkyBlue = Color(0xFFF1FDFF);
    Blue = Color(0xFF12C2CD);
    Red = Color(0xFFFF4949);
    PinkRed = Color(0x88FF4949);
    WeakGray = Color(0xFFE8E8E8);
    StrongGray = Color(0xFFA3A3A3);
    Green = Color(0xFF15705E);
    WeakGreen = Color(0xFFDFEEDD);
    WakamonoGreen = Color(0xFF1D9E85);
  }
}
