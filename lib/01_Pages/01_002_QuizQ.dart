// import 'package:flutter/material.dart';
// import '01_001_QuestionList.dart';
// import '01_003_QuizA.dart';
// import 'package:bunkyoku_app2/02_Class/02_01_QuizQA.dart';
// import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
// import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
// import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
//
// class QuizQ_000 extends StatefulWidget {
//   late final String QuesitonNum;
//   QuizQ_000(this.QuesitonNum);
//   @override
//   State<QuizQ_000> createState() => _QuizQ_000();
// }
//
// class _QuizQ_000 extends State<QuizQ_000> {
//   late final String QuesitonNum = widget.QuesitonNum;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     ColorConfig().init(context);
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: TextButton(
//             child: Column(
//               children: [
//                 Icon(Icons.arrow_back_outlined,size: 12,color: Colors.white,),
//                 Text(
//                   '戻る',
//                   style: TextStyle(
//                     color: Colors.white,  //文字の色を白にする
//                     fontWeight: FontWeight.bold,  //文字を太字する
//                     fontSize: 12.0,  //文字のサイズを調整する
//                   ),
//                 ),
//               ],
//             ),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           title: Row(
//             children: [
//               Text('3'),
//               Text('/100'),
//             ],
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.star_border,color: Colors.white,),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuizA_000(QuesitonNum)));
//               },
//             ),
//           ],
//           iconTheme: IconThemeData(color: Colors.black),
//           backgroundColor: ColorConfig.Blue,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(5.0),
//               width: 100,
//               decoration: BoxDecoration(
//                 border: Border.all(color: ColorConfig.Blue),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Container(
//                 child: Text('No.'+QuizQ_List().list[QuesitonNum]!.QID,
//                   textAlign: TextAlign.center,),
//                 //QestionList()でインスタンス化
//               ),
//             ),
//             Container(
//               child: Text('正解',style: TextStyle(fontSize: 32),),
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 200.0,
//               width: 200.0,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.green,
//                   width: 30,
//                 ),
//               ),
//               child: Image.asset(QuizQ_List().list[QuesitonNum]!.Picture),
//             ),
//             Container(
//               child: Text(QuizQ_List().list[QuesitonNum]!.problem,
//                 textAlign: TextAlign.center,),
//             ),
//             OutlinedButton(
//               child: Text(QuizQ_List().list[QuesitonNum]!.Select1,
//                 textAlign: TextAlign.center,),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 onPrimary: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuizA_000(QuesitonNum)));
//               },
//             ),
//             OutlinedButton(
//               child: Text(QuizQ_List().list[QuesitonNum]!.Select2,
//                 textAlign: TextAlign.center,),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 onPrimary: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuizA_000(QuesitonNum)));
//               },
//             ),
//             OutlinedButton(
//               child: Text(QuizQ_List().list[QuesitonNum]!.Select3,
//                 textAlign: TextAlign.center,),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 onPrimary: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuizA_000(QuesitonNum)));
//               },
//             ),
//             OutlinedButton(
//               child: Text(QuizQ_List().list[QuesitonNum]!.Select4,
//                 textAlign: TextAlign.center,),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 onPrimary: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuizA_000(QuesitonNum)));
//               },
//             ),
//           ],
//         ),),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '01_001_QuestionList.dart';
import '01_003_QuizA.dart';
import 'package:bunkyoku_app2/02_Class/02_01_QuizQA.dart';
import 'package:bunkyoku_app2/02_Class/02_02_QuizQ.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/02_Class/02_06_QuizStatus.dart';
import 'package:bunkyoku_app2/03_Unity/03_01_SqliteDb.dart';

class QuizQ_000 extends StatefulWidget {
  late final String QuesitonNum;
  late String myFavariteFlg;

  QuizQ_000(this.QuesitonNum,this.myFavariteFlg);

  @override
  State<QuizQ_000> createState() => _QuizQ_000();
}

class _QuizQ_000 extends State<QuizQ_000> {
  late final String QuesitonNum = widget.QuesitonNum;
  late String SelectQ = '';
  late String myFavariteFlg = widget.myFavariteFlg;

  @override
  Widget build(BuildContext context) {
    BasePaddingConfig().init(context);
    QuizSelectButtonSizeConfig().init(context);
    SizeConfig().init(context);
    ColorConfig().init(context);
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
          title: Row(
            children: [
              Text('3'),
              Text('/100'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.star,
                color: myFavariteFlg == '0' ? Colors.white : Colors.yellow,
              ),
              onPressed: () async {
                if(myFavariteFlg == '0') {
                  QuizStatusDb().updateFavoriteFlg(
                      QuizQ_List().list[QuesitonNum]!.QID, '1');
                }else{
                  QuizStatusDb().updateFavoriteFlg(
                      QuizQ_List().list[QuesitonNum]!.QID, '0');
                }

                myFavariteFlg = await QuizStatusDb().setFavoriteFlg(QuesitonNum);

                //①QuizStatusクラスのproblemIdに、QuizQ_List().list[QuesitonNum]!.QID,を入れる
                //※このときすでにデータがあれば更新処理は実施しないように制御する。
                //②QuizStatusクラスのfavoriteFlgが0であれば1、1であれば0を代入する
                setState(() {
                });
              },
            ),
          ],
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
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
                  onPressed: () {
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizA_000(QuesitonNum, SelectQ)));
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
                  onPressed: () {
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select2;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizA_000(QuesitonNum, SelectQ)));
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
                  onPressed: () {
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select3;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizA_000(QuesitonNum, SelectQ)));
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
                  onPressed: () {
                    SelectQ = QuizQ_List().list[QuesitonNum]!.Select4;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizA_000(QuesitonNum, SelectQ)));
                  },
                ),
              ),

              // OutlinedButton(
              //   child: Text(
              //     QuizQ_List().list[QuesitonNum]!.Select2,
              //     textAlign: TextAlign.center,
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.orange,
              //     onPrimary: Colors.white,
              //   ),
              //   onPressed: () {
              //     SelectQ = QuizQ_List().list[QuesitonNum]!.Select2;
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 QuizA_000(QuesitonNum, SelectQ)));
              //   },
              // ),
              // OutlinedButton(
              //   child: Text(
              //     QuizQ_List().list[QuesitonNum]!.Select3,
              //     textAlign: TextAlign.center,
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.orange,
              //     onPrimary: Colors.white,
              //   ),
              //   onPressed: () {
              //     SelectQ = QuizQ_List().list[QuesitonNum]!.Select3;
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 QuizA_000(QuesitonNum, SelectQ)));
              //   },
              // ),
              // OutlinedButton(
              //   child: Text(
              //     QuizQ_List().list[QuesitonNum]!.Select4,
              //     textAlign: TextAlign.center,
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.orange,
              //     onPrimary: Colors.white,
              //   ),
              //   onPressed: () {
              //     SelectQ = QuizQ_List().list[QuesitonNum]!.Select1;
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 QuizA_000(QuesitonNum, SelectQ)));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
