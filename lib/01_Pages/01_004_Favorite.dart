import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
import 'package:flutter/material.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import '../02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';

import '01_003_QuizA.dart';

class Favorite extends StatefulWidget {
  @override
  _Favorite createState() => new _Favorite();
}

class _Favorite extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Future<List<QuizStatus>> favoriteList = QuizStatusDb().getFavoriteDataList();
    ColorConfig().init(context);
    BasePaddingConfig().init(context);
    QuizProblemSizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('お気に入り'),
          backgroundColor: ColorConfig.Green,
          automaticallyImplyLeading: false,
        ),
        //backgroundColor: ColorConfig.SkyBlue,
        body: FutureBuilder(
            future: favoriteList,
            builder:
                (BuildContext context, AsyncSnapshot<List<QuizStatus>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return new Align(
                    child: Center(
                      child: new CircularProgressIndicator(),
                    ));
              } else if (snapshot.hasError) {
                return new Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<QuizStatus> quizStatusList = snapshot.data ?? <QuizStatus>[];
                return Align(
                  // オブジェクト配列でカード表示を行う
                  alignment: Alignment.topCenter,
                  child: LimitedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      // ②配列のデータ数分カード表示を行う
                      itemCount: quizStatusList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title:
                                    // ③オブジェクトの属性(タイトル属性)を参照する
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                '${quizStatusList[index].problemId}',
                                                style: TextStyle(
                                                    color: ColorConfig.Black, fontSize: 25),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topCenter,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.bookmark_outlined,
                                                  color: quizStatusList[index].favoriteFlg == '0' ? Colors.white : Colors.yellow,
                                                ),
                                                onPressed: () async {
                                                  if (quizStatusList[index].favoriteFlg == '0') {
                                                    QuizStatusDb().updateFavoriteFlg(
                                                        QuizA_List().list[quizStatusList[index].problemId]!.QID, '1');
                                                  } else {
                                                    QuizStatusDb().updateFavoriteFlg(
                                                        QuizA_List().list[quizStatusList[index].problemId]!.QID, '0');
                                                  }
                                                  quizStatusList[index].favoriteFlg =
                                                  await QuizStatusDb().setFavoriteFlg(quizStatusList[index].problemId);
                                                  //①QuizStatusクラスのproblemIdに、QuizQ_List().list[QuesitonNum]!.QID,を入れる
                                                  //※このときすでにデータがあれば更新処理は実施しないように制御する。
                                                  //②QuizStatusクラスのfavoriteFlgが0であれば1、1であれば0を代入する
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: const EdgeInsets.only(
                                            right: 25.0)),
                                        Flexible(child:Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                child:Image.asset(QuizA_List().list[quizStatusList[index].problemId]!.Picture),
                                            ),
                                            Container(
                                              child: Text(
                                                '問題文:${QuizQ_List().list[quizStatusList[index].problemId]!.problem}',
                                                style: TextStyle(
                                                    color: ColorConfig.Black,
                                                    fontSize: 14),
                                                ),
                                            ),
                                            Padding(
                                                padding:
                                                EdgeInsets.only(top: BasePaddingConfig.basePadding)),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'こたえ:${QuizA_List().list[quizStatusList[index].problemId]!.Answer}',
                                                style: TextStyle(
                                                    color: ColorConfig.Black,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),),
                                      ],
                                    ),
                                    onTap: () async{
                                      // myFavariteFlg = await QuizStatusDb().setFavoriteFlg(quizStatusList[index].problemId);
                                      bool? result = await Navigator.push(
                                          context,
                                        new MaterialPageRoute<bool>(
                                          builder: (BuildContext context) => QuizA_000(quizStatusList[index].problemId,'',quizStatusList[index].favoriteFlg),
                                      ),);
                                      if (result!) {
                                        setState(() {

                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                );
              } else {
                return Text("データが存在しません");
              }
            }

        )

    );
  }}