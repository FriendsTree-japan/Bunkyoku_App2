import 'package:flutter/material.dart';
import '01_002_QuizQ.dart';

class QuizA_000 extends StatefulWidget {
  @override
  State<QuizA_000> createState() => _QuizA_000();
}

class _QuizA_000 extends State<QuizA_000> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Text(
              '戻る',
              style: TextStyle(
                color: Colors.white,  //文字の色を白にする
                fontWeight: FontWeight.bold,  //文字を太字する
                fontSize: 12.0,  //文字のサイズを調整する
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.green,
                    width: 10
                ),
              ),
              child: Image.asset("images/FriendsTree.jpg"),
            ),
            Padding(padding: EdgeInsets.all(20)),
          ],
        ),),
    );
  }
}