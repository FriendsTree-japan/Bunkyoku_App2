import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:intl/intl.dart';
import 'package:bunkyoku_app2/02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';
import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/02_Class/02_07_Rank.dart';
import 'package:bunkyoku_app2/02_Class/02_08_Event.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}

class _QuizeListState extends State<QuizeList> {
  String _questionNum = '';
  //String today = outputFormat.format(now);

  Widget _buildQuizListContainer(problemId, correctFlg, unanswerFlg) {
    late String _problemId = problemId;
    late String _correctFlg = correctFlg;
    late String _unanswerFlg = unanswerFlg;
    String myFavariteFlg = '0';
    if (_unanswerFlg == "0") {
      return Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: QuizListSizeConfig.containerHeightSize,
            height: QuizListSizeConfig.containerWidthSize,
            decoration: BoxDecoration(
              color: ColorConfig.White,
              border: Border.all(color: ColorConfig.Green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              child: Text(
                problemId,
                style: TextStyle(color: ColorConfig.Black,fontSize: 20),
              ),
              onPressed: () async{
                //String _questionNum = '$i';
                _questionNum = _problemId;
                //toString()で型変換をできる。
                bool? result = await Navigator.push(
                  context,
                  new MaterialPageRoute<bool>(
                    builder: (BuildContext context) => QuizQ_000(_questionNum),
                  ),
                );
                if (result!) {
                  setState(() {
                  });
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 15,
              width: 40,
              decoration: BoxDecoration(
                color: ColorConfig.Red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'New',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    } else {
      if (_correctFlg == "0") {
        return Container(
          alignment: Alignment.center,
          width: QuizListSizeConfig.containerHeightSize,
          height: QuizListSizeConfig.containerWidthSize,
          decoration: BoxDecoration(
            color: ColorConfig.White,
            border: Border.all(color: ColorConfig.Black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text(
              problemId,
              style: TextStyle(color: ColorConfig.Black, fontSize: 20),
            ),
            onPressed: () async {
              //String _questionNum = '$i';
              _questionNum = problemId;
              //toString()で型変換をできる。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizQ_000(_questionNum),
                ),
              );
            },
          ),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          width: QuizListSizeConfig.containerHeightSize,
          height: QuizListSizeConfig.containerWidthSize,
          decoration: BoxDecoration(
            color: ColorConfig.WakamonoGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text(
              problemId,
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            onPressed: () async{
              //String _questionNum = '$i';
              _questionNum = problemId;
              //toString()で型変換をできる。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizQ_000(_questionNum),
                ),
              );
            },
          ),
        );
      }
    }
  }
  // Widget _buildMarquee() {
  //   return Marquee(
  //     text: 'Hello Flutter! You are very fast!',
  //     velocity: 50, //速さ
  //     blankSpace: 20, //末尾の余白
  //   );
  // }

  Widget _buildRank(int CorrectCount) {
    if (CorrectCount == 100){
      return Text(Rank().Rank5, style: TextStyle(fontSize: 20));
    }
    else if(CorrectCount >= 75){
      return Text(Rank().Rank4, style: TextStyle(fontSize: 20));
    }
    else if(CorrectCount >= 50){
      return Text(Rank().Rank3, style: TextStyle(fontSize: 20));
    }
    else if(CorrectCount >= 25){
      return Text(Rank().Rank2, style: TextStyle(fontSize: 20));
    }else{
      return Text(Rank().Rank1, style: TextStyle(fontSize: 20));
    }
  }

  String _buildCalender() {
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('MM');
    String month = outputFormat.format(now);
    print(month);
    if (month == '01' ){
      return Event().Event1;
    }
    else if(month == '02'){
      return Event().Event3;
    }
    else if(month == '03'){
      return Event().Event3;
    }
    else if(month == '04'){
      return Event().Event4;
    }
    else if(month == '05'){
      return Event().Event5;
    }
    else if(month == '06'){
      return Event().Event6;
    }
    else if(month == '07'){
      return Event().Event7;
    }
    else if(month == '08'){
      return Event().Event8;
    }
    else if(month == '09'){
      return Event().Event9;
    }
    else if(month == '10'){
      return Event().Event10;
    }
    else if(month == '11'){
      return Event().Event11;
    }else{
      return Event().Event12;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<QuizStatus>> result = QuizStatusDb().getDataList();
    QuizListSizeConfig().init(context);
    ColorConfig().init(context);
    BasePaddingConfig().init(context);
    SizeConfig().init(context);
    Future<String> correctCount = QuizStatusDb().getCorrectCount();

    return Scaffold(
      appBar: AppBar(
        title: Text('文京区アプリ'),
        backgroundColor: ColorConfig.Green,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ColorConfig.WeakGreen,
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              FutureBuilder(
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
                            TextSpan(text: " $correctCount ",style: TextStyle(fontSize: 25,color: ColorConfig.Black),),
                            TextSpan(text: "/${QuizStatusDb.maxQuizQidValue}",style: TextStyle(fontSize: 13,color: ColorConfig.Black),)],
                        ),
                      );
                    }else{
                      return Text("データが存在しません");
                    }
                  }
                  ),
              FutureBuilder(
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
                      int CorrectCount = int.parse(correctCount!);
                      return _buildRank(CorrectCount);
                    }else{
                      return Text("データが存在しません");
                    }
                  }
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            ],
          ),
          FutureBuilder (
              future: result,
              builder: (BuildContext context,
                  AsyncSnapshot<List<QuizStatus>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return new Align(
                      child: Center(
                    child: new CircularProgressIndicator(),
                  ));
                } else if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error!}');
                } else if (snapshot.hasData) {
                  final List<QuizStatus> quizList =
                      snapshot.data ?? <QuizStatus>[];
                  return Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 13.0,
                            childAspectRatio: 1,
                            crossAxisCount: 4,
                          ),
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(32, 10, 32, 32),
                          //カラム数
                          shrinkWrap: true,
                          itemCount: quizList.length,
                          itemBuilder: (BuildContext context, int index){
                            return _buildQuizListContainer (
                                quizList[index].problemId,
                                quizList[index].correctFlg,
                                quizList[index].unansweredFlg);
                          }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40,
                              color: ColorConfig.WeakBlack,
                              child: Expanded(
                                child: Marquee(
                                  text: _buildCalender(), style: TextStyle(color: ColorConfig.White),
                                  velocity: 50,
                                  blankSpace: 40.0,
                                ),
                              ),
                            ), // なにかしらのWidget
                          ),
                    ],),
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
        ],
      ),
    );
  }
}

