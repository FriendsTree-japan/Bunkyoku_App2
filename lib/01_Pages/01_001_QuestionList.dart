import 'package:flutter/material.dart';
import '01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}

class _QuizeListState extends State<QuizeList> {
  String _questionNum = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ColorConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('文京区アプリ'),
        backgroundColor: ColorConfig.Blue,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text('3'
                        ,style: TextStyle(fontSize: 28)),
                  ),
                  Container(
                    child: Text('/100',style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                child: Text('がんばれ〜',style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          Expanded(
            child:GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 16.0,
                crossAxisCount: 3,
                childAspectRatio:1,
              ),
              // scrollDirection: Axis.vertical,
              primary: false,
              padding: const EdgeInsets.fromLTRB(32,10,32,32),
              children:<Widget> [
                for (int i = 1; i <= 100; i++)
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: ColorConfig.Blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(i.toString(), style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        //String _questionNum = '$i';
                        _questionNum = i.toString();
                        //toString()で型変換をできる。
                        Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) => QuizQ_000(_questionNum),),
                        );
                      },
                    ),
                  ),
              ],
            ),
          )// This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }
}