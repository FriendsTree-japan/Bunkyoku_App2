
import 'package:flutter/material.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bunkyoku_app2/main.dart';
import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';

class QuizA_000 extends StatefulWidget {
  late final String QuesitonNum;
  late final String selectQ;
  late String myFavariteFlg;


  QuizA_000(this.QuesitonNum, this.selectQ, this.myFavariteFlg);

  @override
  State<QuizA_000> createState() => _QuizA_000();
}

class _QuizA_000 extends State<QuizA_000> {
  late final String QuesitonNum = widget.QuesitonNum;
  late final String selectQ = widget.selectQ;
  String _questionNum = '';
  int _intNextQuestionNum = 0;
  String _nextQuestionNum = '';
  late String myFavariteFlg = widget.myFavariteFlg;

  Widget _viewCorrectWrong() {
    if (selectQ == QuizA_List().list[QuesitonNum]!.Answer) {
      QuizStatusDb().updateFlg(QuizA_List().list[QuesitonNum]!.QID, 'correct');

      return Column(
        children: [
          Container(
            height: 80,
            child: Center(
              child: Icon(
                Icons.circle_outlined,
                size: 90,
                color: ColorConfig.PinkRed,
              ),
            ),
          ),
          Container(
            child: Center(
                child: Text('正解',
                    style: TextStyle(fontSize: 20, color: ColorConfig.Black))),
          ),
        ],
      );
    } else if (selectQ == "") {
      return Container(
      );
    } else {
      return Column(
        children: [
          Container(
            height: 75,
            child: Center(
              child: Icon(
                Icons.close,
                size: 90,
                color: ColorConfig.PinkRed,
              ),
            ),
          ),
          Container(
            child: Center(
                child: Text('不正解',
                    style: TextStyle(fontSize: 20, color: ColorConfig.Black))),
          ),
        ],
      );
      ;
    }
  }

  Widget _buildSelectedContainer1() {
    if (QuizQ_List().list[QuesitonNum]!.Select1 ==
        QuizA_List().list[QuesitonNum]!.Answer) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            height: QuizProblemSizeConfig.height,
            width: QuizProblemSizeConfig.width,
            decoration: BoxDecoration(
              color: ColorConfig.Blue,
              border: Border.all(color: ColorConfig.Blue),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Text(
                QuizQ_List().list[QuesitonNum]!.Select1,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorConfig.White, fontSize: 24),
              ),
            ),
          ),
        ],
      );
    } else {
      if (selectQ == QuizQ_List().list[QuesitonNum]!.Select1) {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                color: ColorConfig.StrongGray,
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.White, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
                color: ColorConfig.White,
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.Gray, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _buildSelectedContainer2() {
    if (QuizQ_List().list[QuesitonNum]!.Select2 ==
        QuizA_List().list[QuesitonNum]!.Answer) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            height: QuizProblemSizeConfig.height,
            width: QuizProblemSizeConfig.width,
            decoration: BoxDecoration(
              color: ColorConfig.Blue,
              border: Border.all(color: ColorConfig.Blue),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Text(
                QuizQ_List().list[QuesitonNum]!.Select2,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorConfig.White, fontSize: 24),
              ),
            ),
          ),
        ],
      );
    } else {
      if (selectQ == QuizQ_List().list[QuesitonNum]!.Select2) {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                color: ColorConfig.StrongGray,
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.White, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
                color: ColorConfig.White,
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.Gray, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _buildSelectedContainer3() {
    if (QuizQ_List().list[QuesitonNum]!.Select3 ==
        QuizA_List().list[QuesitonNum]!.Answer) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            height: QuizProblemSizeConfig.height,
            width: QuizProblemSizeConfig.width,
            decoration: BoxDecoration(
              color: ColorConfig.Blue,
              border: Border.all(color: ColorConfig.Blue),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Text(
                QuizQ_List().list[QuesitonNum]!.Select3,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorConfig.White, fontSize: 24),
              ),
            ),
          ),
        ],
      );
    } else {
      if (selectQ == QuizQ_List().list[QuesitonNum]!.Select3) {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                color: ColorConfig.StrongGray,
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select3,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.White, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
                color: ColorConfig.White,
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select3,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.Gray, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _buildSelectedContainer4() {
    if (QuizQ_List().list[QuesitonNum]!.Select4 ==
        QuizA_List().list[QuesitonNum]!.Answer) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            height: QuizProblemSizeConfig.height,
            width: QuizProblemSizeConfig.width,
            decoration: BoxDecoration(
              color: ColorConfig.Blue,
              border: Border.all(color: ColorConfig.Blue),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Text(
                QuizQ_List().list[QuesitonNum]!.Select4,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorConfig.White, fontSize: 24),
              ),
            ),
          ),
        ],
      );
    } else {
      if (selectQ == QuizQ_List().list[QuesitonNum]!.Select4) {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                color: ColorConfig.StrongGray,
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select4,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.White, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
            Container(
              height: QuizProblemSizeConfig.height,
              width: QuizProblemSizeConfig.width,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.StrongGray),
                borderRadius: BorderRadius.circular(5),
                color: ColorConfig.White,
              ),
              child: Container(
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.Select4,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorConfig.Gray, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _buildNextPageContainer(String problemId, String myFavariteFlg) {
    String myFavariteFlg = '0';
    //★状態を見たいので一旦「２」にしているがリリース時には「maxQuizQidValue」に変更すること！
    if (problemId != QuizStatusDb.maxQuizQidValue) {
      return Container(
        height: 50,
        width: 240,
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     spreadRadius: 2,
        //     blurRadius: 20,
        //     offset: Offset(0, 6),
        //   )
        // ]),
        child: OutlinedButton(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Next ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                  ),
                  Text(
                    '>',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConfig.Blue, fontSize: 40),
                  ),
                ]),
            style: ElevatedButton.styleFrom(
              primary: ColorConfig.White,
              side: BorderSide(color: ColorConfig.Blue),
              onPrimary: ColorConfig.White,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),

              // radius: BorderRadius.circular(40),
            ),
            onPressed: () async {
              _questionNum = QuesitonNum;
              // print(_questionNum.runtimeType);
              _intNextQuestionNum = int.parse(_questionNum) + 1;
              // print(_intNextQuestionNum.runtimeType);
              _nextQuestionNum = _intNextQuestionNum.toString();

              await QuizStatusDb()
                  .updateFlg(QuizA_List().list[QuesitonNum]!.QID, 'unanwer');

              bool? result = await Navigator.push(
                context,
                new MaterialPageRoute<bool>(
                  //とりあえずmyFavariteFlgは１にしておく（→ゆーすけ）
                  builder: (BuildContext context) =>
                      QuizQ_000(_nextQuestionNum),
                ),
              );
            }),
      );
    } else {
      //問題番号がmaxQuizQidValueの時は、「次へ」を表示しない。
      return Container(child: Text(''));
    }
  }

  Widget _buildPreviewUrl(String url){
    String _url = url;
    return Container(
      width: QuizProblemSizeConfig.width,
      child:AnyLinkPreview(
        displayDirection: uiDirection.uiDirectionHorizontal,
        link: _url,
        cache: Duration(hours: 1),
        backgroundColor: Colors.grey[300],
        errorWidget: Container(
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorConfig().init(context);
    BasePaddingConfig().init(context);
    QuizImageSizeConfig().init(context);
    QuizProblemSizeConfig().init(context);
    Future<String> correctCount = QuizStatusDb().getCorrectCount();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: TextButton(
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  size: 28,
                  color: ColorConfig.White,
                ),
                Text(
                  'ホーム',
                  style: TextStyle(
                    color: ColorConfig.White, //文字の色を白にする
                    fontWeight: FontWeight.bold, //文字を太字する
                    fontSize: 8.0, //文字のサイズを調整する
                  ),
                ),
              ],
            ),
            onPressed: () {
              QuizStatusDb()
                  .updateFlg(QuizA_List().list[QuesitonNum]!.QID, 'unanwer');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            },
          ),
          title: FutureBuilder(
              future: correctCount,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return new Align(
                      child: Center(
                    child: new CircularProgressIndicator(),
                  ));
                } else if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error!}');
                } else if (snapshot.hasData) {
                  String? correctCount = snapshot.data;
                  return Text(
                    'No.' + QuizQ_List().list[QuesitonNum]!.QID,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConfig.White, fontSize: 24),
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
          actions: [
            Column(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_outlined,
                      color: myFavariteFlg == '0' ? Colors.white : Colors.yellow,
                    ),
                    onPressed: () async {
                      if (myFavariteFlg == '0') {
                        QuizStatusDb().updateFavoriteFlg(
                            QuizA_List().list[QuesitonNum]!.QID, '1');
                      } else {
                        QuizStatusDb().updateFavoriteFlg(
                            QuizA_List().list[QuesitonNum]!.QID, '0');
                      }
                      myFavariteFlg =
                      await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                      //①QuizStatusクラスのproblemIdに、QuizQ_List().list[QuesitonNum]!.QID,を入れる
                      //※このときすでにデータがあれば更新処理は実施しないように制御する。
                      //②QuizStatusクラスのfavoriteFlgが0であれば1、1であれば0を代入する
                      setState(() {});
                    },
                  ),
                ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Text('お気入り',
              //         style: TextStyle(
              //             color: ColorConfig.White, //文字の色を白にする
              //             fontWeight: FontWeight.bold, //文字を太字する
              //             fontSize: 5,)),
              // ),
              ],
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorConfig.Green,
        ),
        backgroundColor: ColorConfig.White,
        body: Scrollbar(
          isAlwaysShown: false,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    child: _viewCorrectWrong(),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                      width: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0' ? QuizImageSizeConfig.yokoImageWidth + 20 : QuizImageSizeConfig.tateImageWidth + 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorConfig.WeakGray,
                      ),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: BasePaddingConfig.basePadding)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: BasePaddingConfig.basePadding)),
                          Container(
                            alignment: Alignment.center,
                            height: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0' ? QuizImageSizeConfig.yokoImageHeight : QuizImageSizeConfig.tateImageHeight,
                            width: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0' ? QuizImageSizeConfig.yokoImageWidth : QuizImageSizeConfig.tateImageWidth,
                            child: Image.asset(
                                QuizQ_List().list[QuesitonNum]!.Picture),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: BasePaddingConfig.basePadding)),
                          Container(
                            width: QuizProblemSizeConfig.width,
                            child: Text(
                              QuizQ_List().list[QuesitonNum]!.problem,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          _buildSelectedContainer1(),
                          _buildSelectedContainer2(),
                          _buildSelectedContainer3(),
                          _buildSelectedContainer4(),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: BasePaddingConfig.basePadding)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: BasePaddingConfig.basePadding)),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                          EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    alignment: Alignment.center,
                    height: QuizA_List().list[QuesitonNum]!.PicturePtn == '0' ? QuizImageSizeConfig.yokoImageHeight : QuizImageSizeConfig.tateImageHeight,
                    width: QuizA_List().list[QuesitonNum]!.PicturePtn == '0' ? QuizImageSizeConfig.yokoImageWidth : QuizImageSizeConfig.tateImageWidth,
                    child: Image.asset(QuizA_List().list[QuesitonNum]!.Picture),
                  ),
                  Container(
                    width: QuizProblemSizeConfig.width,
                    child: Text(
                      QuizA_List().list[QuesitonNum]!.Commentary,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(top: QuizA_List().list[QuesitonNum]!.Tips == '' ? 0 : BasePaddingConfig.basePadding)),
                  Container(
                    width: QuizProblemSizeConfig.width,
                    child: Text(
                      QuizA_List().list[QuesitonNum]!.Tips,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: QuizA_List().list[QuesitonNum]!.Tips == '' ? 0 :BasePaddingConfig.basePadding)),
                  _buildPreviewUrl(QuizA_List().list[QuesitonNum]!.URL),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  _buildPreviewUrl(QuizA_List().list[QuesitonNum]!.GoogleMap),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  _buildNextPageContainer(QuesitonNum, '1'),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    child: Text(
                      QuizA_List().list[QuesitonNum]!.CreateDate,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
