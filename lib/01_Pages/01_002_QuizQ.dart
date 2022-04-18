import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:bunkyoku_app2/main.dart';
import 'package:bunkyoku_app2/01_Pages/01_003_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_01_SharedPreferences.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';
import 'package:bunkyoku_app2/99_Others/99_01_GoogleAdmob.dart';

import '../02_Class/02_03_QuizA.dart';
import '01_005_Setting.dart';

class QuizQ_000 extends StatefulWidget {
  late final String QuesitonNum;

  QuizQ_000(this.QuesitonNum);

  @override
  State<QuizQ_000> createState() => _QuizQ_000();
}

class _QuizQ_000 extends State<QuizQ_000> {
  late final String QuesitonNum = widget.QuesitonNum;
  late String SelectQ = '';
  late String myFavariteFlg = "0";
  late String correctCount = '';
  InterstitialAd? _interstitialAd;
  AdInterstitial adInterstitial = new AdInterstitial();

  @override
  void initState() {
    super.initState();
    adInterstitial.createAd();
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BasePaddingConfig().init(context);
    QuizProblemSizeConfig().init(context);
    QuizImageSizeConfig().init(context);
    ColorConfig().init(context);
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
                  color: Colors.white,
                ),
                Text(
                  'ホーム',
                  style: TextStyle(
                    color: Colors.white, //文字の色を白にする
                    fontWeight: FontWeight.bold, //文字を太字する
                    fontSize: 8.0, //文字のサイズを調整する
                  ),
                ),
              ],
            ),
            onPressed: () {
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
                    style: TextStyle(fontSize: 24),
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
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
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  _buildQuition(),
                  Container(
                    height: QuizProblemSizeConfig.height,
                    width: QuizProblemSizeConfig.width,
                    child: OutlinedButton(
                      child: Text(
                        QuizQ_List().list[QuesitonNum]!.Select1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: ColorConfig.Blue),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        SelectQ = QuizQ_List().list[QuesitonNum]!.Select1;
                        myFavariteFlg =
                        await QuizStatusDb().setFavoriteFlg(QuesitonNum);

                        if (Setting.soundFlg!) {
                          if (SelectQ ==
                              QuizA_List().list[QuesitonNum]!.Answer) {
                            final player = AudioCache();
                            player.play('OK.mp3');
                          } else {
                            final player = AudioCache();
                            player.play('NG.mp3');
                          }
                        }
                        //toString()で型変換をできる。
                        //5回目の回答を実施した時に広告を表示数する
                        int admCtlCnt = await SharedPrefs.admCtlMethod();
                        if (admCtlCnt == 5) {
                          await adInterstitial.showAd();
                          adInterstitial.createAd();
                        }
                        bool? result = await Navigator.push(
                          context,
                          new MaterialPageRoute<bool>(
                            builder: (BuildContext context) =>
                                QuizA_000(QuesitonNum, SelectQ, myFavariteFlg),
                          ),
                        );
                        if (result!) {
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    height: QuizProblemSizeConfig.height,
                    width: QuizProblemSizeConfig.width,
                    child: OutlinedButton(
                      child: Text(
                        QuizQ_List().list[QuesitonNum]!.Select2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: ColorConfig.Blue),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        SelectQ = QuizQ_List().list[QuesitonNum]!.Select2;
                        myFavariteFlg =
                        await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                        if (Setting.soundFlg!) {
                          if (SelectQ ==
                              QuizA_List().list[QuesitonNum]!.Answer) {
                            final player = AudioCache();
                            player.play('OK.mp3');
                          } else {
                            final player = AudioCache();
                            player.play('NG.mp3');
                          }
                        }
                        //toString()で型変換をできる。
                        //5回目の回答を実施した時に広告を表示数する
                        int admCtlCnt = await SharedPrefs.admCtlMethod();
                        if (admCtlCnt == 5) {
                          await adInterstitial.showAd();
                          adInterstitial.createAd();
                        }
                        bool? result = await Navigator.push(
                          context,
                          new MaterialPageRoute<bool>(
                            builder: (BuildContext context) =>
                                QuizA_000(QuesitonNum, SelectQ, myFavariteFlg),
                          ),
                        );
                        if (result!) {
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    height: QuizProblemSizeConfig.height,
                    width: QuizProblemSizeConfig.width,
                    child: OutlinedButton(
                      child: Text(
                        QuizQ_List().list[QuesitonNum]!.Select3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: ColorConfig.Blue),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        SelectQ = QuizQ_List().list[QuesitonNum]!.Select3;
                        myFavariteFlg =
                        await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                        if (Setting.soundFlg!) {
                          if (SelectQ ==
                              QuizA_List().list[QuesitonNum]!.Answer) {
                            final player = AudioCache();
                            player.play('OK.mp3');
                          } else {
                            final player = AudioCache();
                            player.play('NG.mp3');
                          }
                        }
                        //toString()で型変換をできる。
                        //5回目の回答を実施した時に広告を表示数する
                        int admCtlCnt = await SharedPrefs.admCtlMethod();
                        if (admCtlCnt == 5) {
                          await adInterstitial.showAd();
                          adInterstitial.createAd();
                        }
                        bool? result = await Navigator.push(
                          context,
                          new MaterialPageRoute<bool>(
                            builder: (BuildContext context) =>
                                QuizA_000(QuesitonNum, SelectQ, myFavariteFlg),
                          ),
                        );
                        if (result!) {
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                  Container(
                    height: QuizProblemSizeConfig.height,
                    width: QuizProblemSizeConfig.width,
                    child: OutlinedButton(
                      child: Text(
                        QuizQ_List().list[QuesitonNum]!.Select4,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: ColorConfig.Blue),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        SelectQ = QuizQ_List().list[QuesitonNum]!.Select4;
                        myFavariteFlg =
                        await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                        if (Setting.soundFlg!) {
                          if (SelectQ ==
                              QuizA_List().list[QuesitonNum]!.Answer) {
                            final player = AudioCache();
                            player.play('OK.mp3');
                          } else {
                            final player = AudioCache();
                            player.play('NG.mp3');
                          }
                        }
                        //toString()で型変換をできる。
                        //5回目の回答を実施した時に広告を表示数する
                        int admCtlCnt = await SharedPrefs.admCtlMethod();
                        if (admCtlCnt == 5) {
                          await adInterstitial.showAd();
                          adInterstitial.createAd();
                        }
                        bool? result = await Navigator.push(
                          context,
                          new MaterialPageRoute<bool>(
                            builder: (BuildContext context) =>
                                QuizA_000(QuesitonNum, SelectQ, myFavariteFlg),
                          ),
                        );
                        if (result!) {
                          setState(() {});
                        }
                      },
                    ),
                  ),
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

  Widget _buildQuition() {
    if (QuizQ_List().list[QuesitonNum]!.Picture != '') {
      return Column(
        children: [
          Padding(
              padding:
              EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            alignment: Alignment.center,
            height: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0'
                ? QuizImageSizeConfig.yokoImageHeight
                : QuizImageSizeConfig.tateImageHeight,
            width: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0'
                ? QuizImageSizeConfig.yokoImageWidth
                : QuizImageSizeConfig.tateImageWidth,
            child: QuizQ_List().list[QuesitonNum]!.Picture == ''
                ? Container()
                : Image.asset(QuizQ_List().list[QuesitonNum]!.Picture),
          ),
          Padding(
              padding:
              EdgeInsets.only(top: BasePaddingConfig.basePadding)),
          Container(
            width: QuizProblemSizeConfig.width,
            child: Text(
              QuizQ_List().list[QuesitonNum]!.problem,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
              padding:
              EdgeInsets.only(top: BasePaddingConfig.
              basePadding
              )
          )
        ],
      );
  }else{
      return Column(
        children: [
          Container(
            width: QuizProblemSizeConfig.width,
            child: Text(
              QuizQ_List().list[QuesitonNum]!.problem,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0'
                ? QuizImageSizeConfig.yokoImageHeight
                : QuizImageSizeConfig.tateImageHeight,
            width: QuizQ_List().list[QuesitonNum]!.PicturePtn == '0'
                ? QuizImageSizeConfig.yokoImageWidth
                : QuizImageSizeConfig.tateImageWidth,
            child: QuizQ_List().list[QuesitonNum]!.Picture == ''
                ? Container()
                : Image.asset(QuizQ_List().list[QuesitonNum]!.Picture),
          ),
          Padding(
              padding:
              EdgeInsets.only(top: BasePaddingConfig.
              basePadding
              )
          )
        ],
      );


    }
}
}
