import 'package:bunkyoku_app2/02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_01_SqliteDb.dart';
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
              onPressed: () {
                //String _questionNum = '$i';
                _questionNum = _problemId;
                //toString()で型変換をできる。
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => QuizQ_000(_questionNum),
                  ),
                );
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
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
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
            color: ColorConfig.Blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text(
              problemId,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
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

  Future<List<QuizStatus>> result = QuizStatusDb().getDataList();

  @override
  Widget build(BuildContext context) {
    QuizListSizeConfig().init(context);
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
                    child: Text('3', style: TextStyle(fontSize: 28)),
                  ),
                  Container(
                    child: Text('/100', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                child: Text('がんばれ〜', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          FutureBuilder(
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
                        itemBuilder: (BuildContext context, int index) {
                          return _buildQuizListContainer(
                              quizList[index].problemId,
                              quizList[index].correctFlg,
                              quizList[index].unansweredFlg);
                          //   Container(
                          //   alignment: Alignment.center,
                          //   width: QuizListSizeConfig.containerHeightSize,
                          //   height: QuizListSizeConfig.containerWidthSize,
                          //   decoration: BoxDecoration(
                          //     color: quizList[index].correctFlg == "1"
                          //         ? ColorConfig.Gray
                          //         : ColorConfig.Blue,
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: TextButton(
                          //     child: Text(
                          //       quizList[index].problemId,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     onPressed: () {
                          //       //String _questionNum = '$i';
                          //       _questionNum = quizList[index].problemId;
                          //       //toString()で型変換をできる。
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               QuizQ_000(_questionNum),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // );
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
