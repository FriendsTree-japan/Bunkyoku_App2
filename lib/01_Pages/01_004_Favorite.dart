import 'package:bunkyoku_app2/01_Pages/01_002_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
import 'package:flutter/material.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import '../02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_02_SqliteDb.dart';

class Favorite extends StatefulWidget {
  @override
  _Favorite createState() => new _Favorite();
}

class _Favorite extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Future<List<QuizStatus>> favoriteList = QuizStatusDb().getFavoriteDataList();
    SizeConfig().init(context);
    ColorConfig().init(context);
    BasePaddingConfig().init(context);
    QuizSelectButtonSizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('お気に入り'),
          backgroundColor: ColorConfig.Blue,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '${quizStatusList[index].problemId}',
                                            style: TextStyle(
                                                color: ColorConfig.Black, fontSize: 18),
                                          ),
                                        ),
                                        Padding(padding: const EdgeInsets.only(
                                            right: 20.0)),
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '問題文:${QuizQ_List().list[quizStatusList[index].problemId]!.problem}',
                                                style: TextStyle(
                                                    color: ColorConfig.Black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'こたえ:${QuizA_List().list[quizStatusList[index].problemId]!.Answer}',
                                                style: TextStyle(
                                                    color: ColorConfig.Black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onTap: () async{
                                      // myFavariteFlg = await QuizStatusDb().setFavoriteFlg(quizStatusList[index].problemId);
                                      bool? result = await Navigator.push(
                                          context,
                                        new MaterialPageRoute<bool>(
                                          builder: (BuildContext context) => QuizQ_000(quizStatusList[index].problemId),
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