import 'package:flutter/material.dart';
import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';

class QuizA_000 extends StatefulWidget {
  late final String QuesitonNum;
  QuizA_000(this.QuesitonNum);
  @override
  State<QuizA_000> createState() => _QuizA_000();
}

class _QuizA_000 extends State<QuizA_000> {
  late final String QuesitonNum = widget.QuesitonNum;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ColorConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Column(
              children: [
                Icon(Icons.arrow_back_outlined,size: 12,color: Colors.white,),
                Text(
                  '戻る',
                  style: TextStyle(
                    color: Colors.white,  //文字の色を白にする
                    fontWeight: FontWeight.bold,  //文字を太字する
                    fontSize: 12.0,  //文字のサイズを調整する
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              Text('3'),
              Text('/100'),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorConfig.Blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.Blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: Text('No.'+QuizA_List().list[QuesitonNum]!.QID,
                  textAlign: TextAlign.center,),
                //QestionList()でインスタンス化
              ),
            ),
            Container(
              child: Text('正解',style: TextStyle(fontSize: 32),),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.Blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: Text(QuizA_List().list[QuesitonNum]!.Answer,
                  textAlign: TextAlign.center,),
                //QestionList()でインスタンス化
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 30,
                ),
              ),
              child: Image.asset(QuizA_List().list[QuesitonNum]!.Picture),
            ),
            Container(
              child: Text(QuizA_List().list[QuesitonNum]!.Commentary,
                textAlign: TextAlign.center,),
            ),
            Container(
              child: Text(QuizA_List().list[QuesitonNum]!.Tips,
                textAlign: TextAlign.center,),
            ),
          ],
        ),),
    );
  }
}