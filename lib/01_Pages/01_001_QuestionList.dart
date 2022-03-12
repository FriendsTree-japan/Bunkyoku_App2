import 'package:bunkyoku_app2/02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';
import 'package:flutter/material.dart';
import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}

class _QuizeListState extends State<QuizeList> {
  String _questionNum = '';

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
              border: Border.all(color: ColorConfig.Black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              child: Text(
                problemId,
                style: TextStyle(color: ColorConfig.Black),
              ),
              onPressed: () async{
                //String _questionNum = '$i';
                _questionNum = _problemId;
                myFavariteFlg = await QuizStatusDb().setFavoriteFlg(_questionNum);
                //toString()で型変換をできる。
                bool? result = await Navigator.push(
                  context,
                  new MaterialPageRoute<bool>(
                    builder: (BuildContext context) => QuizQ_000(_questionNum,myFavariteFlg),
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
                'new',textAlign: TextAlign.center,
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
            border: Border.all(color: ColorConfig.Blue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text(
              problemId,
              style: TextStyle(color: ColorConfig.Black),
            ),
            onPressed: () async{
              myFavariteFlg = await QuizStatusDb().setFavoriteFlg(_questionNum);
              //String _questionNum = '$i';
              _questionNum = problemId;
              //toString()で型変換をできる。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizQ_000(_questionNum,myFavariteFlg),
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
            color: ColorConfig.Blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text(
              problemId,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async{
              //String _questionNum = '$i';
              _questionNum = problemId;
              myFavariteFlg = await QuizStatusDb().setFavoriteFlg(_questionNum);
              //toString()で型変換をできる。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizQ_000(_questionNum,myFavariteFlg),
                ),
              );
            },
          ),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    Future<List<QuizStatus>> result = QuizStatusDb().getDataList();
    QuizListSizeConfig().init(context);
    SizeConfig().init(context);
    ColorConfig().init(context);
    Future<String> correctCount = QuizStatusDb().getCorrectCount();

    return Scaffold(
      appBar: AppBar(
        title: Text('文京区アプリ'),
        backgroundColor: ColorConfig.Blue,
      ),
      body: Column(
        children: [
          Column(
            children: [
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
                            TextSpan(text: "/100",style: TextStyle(fontSize: 13,color: ColorConfig.Black),)],
                        ),
                      );
                    }else{
                      return Text("データが存在しません");
                    }
                  }),
              Container(
                child: Text('がんばれ〜', style: TextStyle(fontSize: 20)),
              ),
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
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 1,
                          crossAxisCount: 3,
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
