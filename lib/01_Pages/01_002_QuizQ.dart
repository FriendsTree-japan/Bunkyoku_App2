import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:bunkyoku_app2/01_Pages/01_003_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';
import 'package:bunkyoku_app2/99_Others/99_01_GoogleAdmob.dart';

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
    QuizSelectButtonSizeConfig().init(context);
    SizeConfig().init(context);
    ColorConfig().init(context);
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
            onPressed: () => Navigator.pop(context,true),
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
                    'No.' + QuizQ_List().list[QuesitonNum]!.QID,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  //QestionList()でインスタンス化
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                child: Text(
                  '問題',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                alignment: Alignment.center,
                height: 169.0,
                width: 256.0,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.green,
                //   ),
                // ),
                child: Image.asset(QuizQ_List().list[QuesitonNum]!.Picture),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                width:240,
                child: Text(
                  QuizQ_List().list[QuesitonNum]!.problem,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: QuizSelectButtonSizeConfig.height,
                width: QuizSelectButtonSizeConfig.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ]),
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
                  onPressed: () async{
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select1;
                    myFavariteFlg = await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                    //toString()で型変換をできる。
                    bool? result = await Navigator.push(
                      context,
                      new MaterialPageRoute<bool>(
                        builder: (BuildContext context) => QuizA_000(QuesitonNum, SelectQ,myFavariteFlg),
                      ),
                    );
                    if (result!) {
                      setState(() {
                      });
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: QuizSelectButtonSizeConfig.height,
                width: QuizSelectButtonSizeConfig.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ]),
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
                  onPressed: () async{
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select2;
                    myFavariteFlg = await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                    //toString()で型変換をできる。
                    bool? result = await Navigator.push(
                      context,
                      new MaterialPageRoute<bool>(
                        builder: (BuildContext context) => QuizA_000(QuesitonNum, SelectQ,myFavariteFlg),
                      ),
                    );
                    if (result!) {
                      setState(() {
                      });
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: QuizSelectButtonSizeConfig.height,
                width: QuizSelectButtonSizeConfig.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ]),
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
                  onPressed: () async{
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select3;
                    myFavariteFlg = await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                    //toString()で型変換をできる。
                    bool? result = await Navigator.push(
                      context,
                      new MaterialPageRoute<bool>(
                        builder: (BuildContext context) => QuizA_000(QuesitonNum, SelectQ,myFavariteFlg),
                      ),
                    );
                    if (result!) {
                      setState(() {
                      });
                    }
                    },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: QuizSelectButtonSizeConfig.height,
                width: QuizSelectButtonSizeConfig.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ]),
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
                  onPressed: () async{
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select4;
                    myFavariteFlg = await QuizStatusDb().setFavoriteFlg(QuesitonNum);
                    //toString()で型変換をできる。
                    bool? result = await Navigator.push(
                      context,
                      new MaterialPageRoute<bool>(
                        builder: (BuildContext context) => QuizA_000(QuesitonNum, SelectQ,myFavariteFlg),
                      ),
                    );
                    if (result!) {
                      setState(() {
                      });
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: BasePaddingConfig.basePadding)),
              Container(
                height: QuizSelectButtonSizeConfig.height,
                width: QuizSelectButtonSizeConfig.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ]),
                child: OutlinedButton(
                  child: Text(
                    'Google広告を表示する'
                    ,style: TextStyle(color: ColorConfig.Blue, fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: ColorConfig.Blue),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    adInterstitial.showAd();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
