// import 'package:flutter/material.dart';
// import 'package:bunkyoku_app2/02_Class/02_03_QuizA.dart';
// import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
// import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
// import '../02_Class/02_06_QuizStatus.dart';
// import 'package:bunkyoku_app2/03_Unity/03_01_SharedPreferences.dart';
// import 'package:bunkyoku_app2/03_Unity/03_01_SqliteDb.dart';
//
// class Favorite extends StatefulWidget {
//   @override
//   _Favorite createState() => new _Favorite();
// }
//
// class _Favorite extends State<Favorite> {
//   Future<List<QuizStatus>> result = QuizStatusDb().getDataList();
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     ColorConfig().init(context);
//     BasePaddingConfig().init(context);
//     QuizSelectButtonSizeConfig().init(context);
//     return Scaffold(
//         backgroundColor: const Color(0xFFFFFFFF),
//         body: FutureBuilder(
//             future: result,
//             builder:
//                 (BuildContext context, AsyncSnapshot<List<QuizStatus>> snapshot) {
//               if (snapshot.connectionState != ConnectionState.done) {
//                 return new Align(
//                     child: Center(
//                       child: new CircularProgressIndicator(),
//                     ));
//               } else if (snapshot.hasError) {
//                 return new Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData) {
//                 final List<QuizStatus> quizStatusList = snapshot.data ?? <QuizStatus>[];
//                 return Align(
//                   // オブジェクト配列でカード表示を行う
//                   alignment: Alignment.topCenter,
//                   child: LimitedBox(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.all(8),
//                       // ②配列のデータ数分カード表示を行う
//                       itemCount: quizStatusList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                             child: InkWell(
//                               child: Column(
//                                 children: <Widget>[
//                                   ListTile(
//                                     leading: quizStatusList[index].tableName ==
//                                         "profile001" ?
//                                     Image.asset(
//                                         'images/select_profile_images/Profile002_App.jpg',
//                                         fit: BoxFit.cover):
//                                     quizStatusList[index].tableName ==
//                                         "profile002" ? Image.asset('images/select_profile_images/Profile001_App.jpg')
//                                         : Image.asset('images/select_profile_images/Profile003_App.jpg'),
//                                     title:
//                                     // ③オブジェクトの属性(タイトル属性)を参照する
//                                     Text(
//                                       '${quizStatusList[index].saveName}',
//                                       style: TextStyle(
//                                           color: Colors.green, fontSize: 18),
//                                     ),
//                                     subtitle: Text(
//                                       '${quizStatusList[index].koshinYmd}',
//                                       style: TextStyle(
//                                           color: const Color(0xFF737373),
//                                           fontSize: 12),
//                                     ),
//                                     trailing: IconButton(
//                                       icon: new Icon(Icons.delete),
//                                       onPressed: () async {
//                                         // 削除の確認ダイアログを表示
//                                         profileShow proshow = new profileShow();
//                                         await proshow.confirmDeleteDialog(
//                                             prolists[index].id,
//                                             prolists[index].tableName,
//                                             context);
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ));
//                       },
//                     ),
//                   ),
//                 );
//               } else {
//                 return Text("データが存在しません");
//               }
//             }
//
//         )
//
//     );
//   }}