import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:flutter/material.dart';
import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';

class QuizA_000 extends StatefulWidget {
  late final String QuesitonNum;
  late final String selectQ;

  QuizA_000(this.QuesitonNum, this.selectQ);

  @override
  State<QuizA_000> createState() => _QuizA_000();
}

class _QuizA_000 extends State<QuizA_000> {
  late final String QuesitonNum = widget.QuesitonNum;
  late final String selectQ = widget.selectQ;
  String _questionNum = '';
  int _intNextQuestionNum = 0;
  String _nextQuestionNum = '';

  Widget _buildChild() {
    if (selectQ == QuizA_List().list[QuesitonNum]!.Answer) {
      QuizStatusDb().updateFlg(QuizA_List().list[QuesitonNum]!.QID, 'correct');
      return Text('正解', style: TextStyle(fontSize: 24));
    }
    return Text('不正解', style: TextStyle(fontSize: 24));
  }

  Widget _buildNextPageContainer(String problemId,String myFavariteFlg) {
    String myFavariteFlg = '0';
    if (problemId != "2") {
      return Container(
        height: 50,
        width: 240,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 6),
          )
        ]),
        child: OutlinedButton(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Next ',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: ColorConfig.Blue, fontSize: 24),
                  ),
                  Text(
                    '>',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: ColorConfig.Blue, fontSize: 40),
                  ),
                ]),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: ColorConfig.Blue),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              // radius: BorderRadius.circular(40),
            ),
            onPressed: () async {
              _questionNum = QuesitonNum;
              // print(_questionNum.runtimeType);
              _intNextQuestionNum = int.parse(_questionNum) + 1;
              // print(_intNextQuestionNum.runtimeType);
              _nextQuestionNum = _intNextQuestionNum.toString();

              QuizStatusDb().updateFlg(
                  QuizA_List().list[QuesitonNum]!.QID, 'unanwer');
              bool? result = await Navigator.push(
                context,
                new MaterialPageRoute<bool>(
                  //とりあえずmyFavariteFlgは１にしておく（→ゆーすけ）
                  builder: (BuildContext context) =>
                      QuizQ_000(_nextQuestionNum, '1'),
                ),
              );
            }
        ),
      );
    } else {
      //問題番号が１００の時は、「次へ」を表示しない。
      return Container(child:Text(''));
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ColorConfig().init(context);
    BasePaddingConfig().init(context);
    QuizSelectButtonSizeConfig().init(context);
    Future<String> correctCount = QuizStatusDb().getCorrectCount();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Column(
              children: [
                Icon(
                  Icons.arrow_back_outlined,
                  size: 12,
                  color: Colors.white,
                ),
                Text(
                  '戻る',
                  style: TextStyle(
                    color: Colors.white, //文字の色を白にする
                    fontWeight: FontWeight.bold, //文字を太字する
                    fontSize: 12.0, //文字のサイズを調整する
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          title: FutureBuilder(
              future: correctCount,
              builder: (BuildContext context,
                  AsyncSnapshot<String> snapshot){
                if (snapshot.connectionState != ConnectionState.done){
                  return new Align(
                      child: Center(
                        child: new CircularProgressIndicator(),
                      ));
                }else if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error!}');
                }else if (snapshot.hasData){
                  String? correctCount = snapshot.data;
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: " $correctCount ",style: TextStyle(fontSize: 25),),
                        TextSpan(text: "/100",style: TextStyle(fontSize: 18),)],
                    ),
                  );
                }else{
                  return Text("データが存在しません");
                }
              }),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorConfig.Blue,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: 37,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConfig.Blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'No.' + QuizA_List().list[QuesitonNum]!.QID,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  //QestionList()でインスタンス化
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                child: _buildChild(),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 42,
                width: 278,
                decoration: BoxDecoration(
                  color: ColorConfig.Blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Text(
                    QuizA_List().list[QuesitonNum]!.Answer,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConfig.White, fontSize: 24),
                  ),
                  //QestionList()でインスタンス化
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                alignment: Alignment.center,
                height: 169.0,
                width: 256.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Image.asset(QuizA_List().list[QuesitonNum]!.Picture),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                width: 240,
                child: Text(
                  QuizA_List().list[QuesitonNum]!.Commentary,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  QuizA_List().list[QuesitonNum]!.Tips,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              _buildNextPageContainer(QuesitonNum,'1')
            ],
          ),
        ),
      ),
    );
  }
}
