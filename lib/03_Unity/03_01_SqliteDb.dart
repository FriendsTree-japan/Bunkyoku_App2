import 'package:bunkyoku_app2/02_Class/02_06_QuizStatus.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';

import '03_01_SharedPreferences.dart';

class QuizStatusDb {
  void createData() async {
    debugPrint("createData start");
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quizStatus.db");

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE IF NOT EXISTS quizStatus (problemId INTEGER PRIMARY KEY, unansweredFlg TEXT, correctFlg TEXT , favoriteFlg TEXT)",
          );
        });
    debugPrint("createData end");
    String? firstLoginFlg = SharedPrefs.getFirstLoginFlg();

    if (firstLoginFlg == "0") {
      for (int i = 1; i <= 100; i++) {
        String query =
            'INSERT INTO quizStatus(problemId,unansweredFlg, correctFlg, favoriteFlg) '
            'VALUES($i,"0", "0", "0")';
        await database.transaction((txn) async {
          int id = await txn.rawInsert(query);
          print("insert: $i");
        });
      }
      await SharedPrefs.setFirstLoginFlg("1");
    }
  }

  //クイズステータスデータの取得

//データ選択(List表示)
  Future<List<QuizStatus>> getDataList() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quizStatus.db");
    final database = await openDatabase(
      path,
      version: 1,
    );
    final Database db = await database;
    List<QuizStatus> quizStatusList = <QuizStatus>[];

    // final List<Map> mapsQuizStatus =
    // await db.query("quizStatus");
    // return mapsQuizStatus.map((Map m) {
    //   String problemId = m["problemId"];
    //   String unansweredFlg = m["unansweredFlg"];
    //   String correctFlg = m["correctFlg"];
    //   String favoriteFlg = m["favoriteFlg"];
    final List<Map<String, dynamic>> mapsQuizStatus =
    await db.rawQuery('SELECT * FROM quizStatus');

    quizStatusList = new List.generate(mapsQuizStatus.length, (i) {
      return QuizStatus(
        problemId: mapsQuizStatus[i]['problemId'].toString(),
        unansweredFlg: mapsQuizStatus[i]['unansweredFlg'],
        correctFlg: mapsQuizStatus[i]['correctFlg'],
        favoriteFlg: mapsQuizStatus[i]['favoriteFlg'],
      );
    });
    return quizStatusList;
  }
}

// //データ選択(List表示)
// Future<List<QuizStatus>> getDataList() async {
//   String dbPath = await getDatabasesPath();
//   String path = join(dbPath, "quizStatus.db");
//   final database = await openDatabase(
//     path,
//     version: 1,
//   );
//   final Database db = await database;
//   List<QuizStatus> quizStatusList = <QuizStatus>[];
//
//   final List<Map<String, dynamic>> mapsQuizStatus =
//   await db.rawQuery('SELECT * FROM quizStatus');
//
//   quizStatusList = new List.generate(mapsQuizStatus.length, (i) {
//     return QuizStatus(
//       problemId: mapsQuizStatus[i]['problemId'],
//       unansweredFlg: mapsQuizStatus[i]['unansweredFlg'],
//       correctFlg: mapsQuizStatus[i]['correctFlg'],
//       favoriteFlg: mapsQuizStatus[i]['favoriteFlg'],
//     );
//   });
//   return quizStatusList;