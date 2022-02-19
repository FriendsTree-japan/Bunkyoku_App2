import 'package:flutter/material.dart';
import '01_001_QuestionList.dart';
import '01_003_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_01_QuizQA.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';

class QuizQ_000 extends StatefulWidget {
  late final String QuesitonNum;
  QuizQ_000(this.QuesitonNum);
  @override
  State<QuizQ_000> createState() => _QuizQ_000();
}

class _QuizQ_000 extends State<QuizQ_000> {
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
          actions: [
            IconButton(
              icon: Icon(Icons.star_border,color: Colors.white,),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizA_000()));
              },
            ),
          ],
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
                child: Text('No.'+QuizQ_List().list[QuesitonNum]!.QID,
                  textAlign: TextAlign.center,),
                //QestionList()でインスタンス化
              ),
            ),
            Container(
              child: Text('正解',style: TextStyle(fontSize: 32),),
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
              child: Image.asset(QuizQ_List().list[QuesitonNum]!.Picture),
            ),
            Container(
              child: Text(QuizQ_List().list[QuesitonNum]!.problem,
                textAlign: TextAlign.center,),
            ),
            OutlinedButton(
              child: Text(QuizQ_List().list[QuesitonNum]!.Select1,
                textAlign: TextAlign.center,),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
            ),
            OutlinedButton(
              child: Text(QuizQ_List().list[QuesitonNum]!.Select2,
                textAlign: TextAlign.center,),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
            ),
            OutlinedButton(
              child: Text(QuizQ_List().list[QuesitonNum]!.Select3,
                textAlign: TextAlign.center,),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
            ),
            OutlinedButton(
              child: Text(QuizQ_List().list[QuesitonNum]!.Select4,
                textAlign: TextAlign.center,),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),),
    );
  }
}