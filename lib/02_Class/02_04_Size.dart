import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double widgetHeightSizeFirst;
  static late double widgetHeightSizeSecond;
  static late double widgetHeightSizeThird;
  static late double widgetHeightSizePhoto;
  static late double widgetPaddingSize;
  static late double bigFontSize;
  static late double middleFontSize;
  static late double smallFontSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    //デバイスのサイズを取得
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    //フォントのサイズを定義
    bigFontSize = 40.0;
    middleFontSize = 14.0;
    smallFontSize = 12.0;

    //各ウィジェッsアイズを定義
    if (screenHeight > 900) {
      widgetHeightSizeFirst = 280.0;
      widgetHeightSizeSecond = 140.0;
      widgetHeightSizeThird = 140.0;
      widgetHeightSizePhoto = 200;
    } else if (screenHeight > 700) {
      widgetHeightSizeFirst = 280.0;
      widgetHeightSizeSecond = 126.0;
      widgetHeightSizeThird = 150.0;
      widgetHeightSizePhoto = 200;
    } else {
      widgetHeightSizeFirst = 280.0;
      widgetHeightSizeSecond = 126.0;
      widgetHeightSizeThird = 120.0;
      widgetHeightSizePhoto = 180;
    }

    //各ウィジェット間のPaddingの値を定義
    if (screenHeight > 900) {
      widgetPaddingSize = 26.0;
    } else if (screenHeight > 700) {
      widgetPaddingSize = 20.0;
    } else {
      widgetPaddingSize = 5.0;
    }
  }
}

