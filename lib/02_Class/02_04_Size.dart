import 'package:flutter/cupertino.dart';

class QuizListSizeConfig{
  static late double containerHeightSize;
  static late double containerWidthSize;
  void init(BuildContext context){
    containerHeightSize = 80;
    containerWidthSize = 80;
  }
}

class BasePaddingConfig{
  static late double basePadding;
  void init(BuildContext context){
    basePadding = 10.0;
  }
}

class QuizImageSizeConfig{
  static late double height;
  static late double width;
  void init(BuildContext context){
    height = 190.0;
    width = 320.0;
  }
}

class QuizProblemSizeConfig{
  static late double height;
  static late double width;
  void init(BuildContext context){
    height = 42.0;
    width = 320.0;
  }
}
