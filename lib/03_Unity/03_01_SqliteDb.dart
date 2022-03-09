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

  //データ選択(List表示)お気に入り
  Future<List<QuizStatus>> getFavoriteDataList() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quizStatus.db");
    final database = await openDatabase(
      path,
      version: 1,
    );
    final Database db = await database;
    List<QuizStatus> quizStatusList = <QuizStatus>[];

    final List<Map<String, dynamic>> mapsQuizStatus =
    await db.rawQuery('SELECT * FROM quizStatus where favoriteFlg = "1"');

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

  Future<void> updateData(String problemId, String favoriteFlg) async {
    debugPrint("Updata start");
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quizStatus.db");
    final database = await openDatabase(
      path,
      version: 1,
    );
    final Database db = await database;
    var values = <String, dynamic>{
      "favoriteFlg": favoriteFlg,
    };
    await db.update(
      'quizStatus',
      values,
      where: "problemId = ?",
      whereArgs: [problemId],
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

//データ選択(List表示)
  Future<String> setFavoriteFlg(String problemId) async {
    String myFavariteFlg = '0';
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quizStatus.db");
    final database = await openDatabase(
      path,
      version: 1,
    );
    final Database db = await database;
    List<QuizStatus> quizStatusList = <QuizStatus>[];

    // final List<Map<String, dynamic>> mapsQuizStatus =
    // await db.rawQuery('SELECT * FROM quizStatus');

    final List<Map<String, dynamic>> myFavariteFlgWork;

    myFavariteFlgWork = await db.rawQuery(
        'SELECT favoriteFlg FROM quizStatus where problemId = "$problemId" ');
    print(myFavariteFlgWork);
    myFavariteFlg = myFavariteFlgWork[0]['favoriteFlg'];
    return Future.value(myFavariteFlg);

    // quizStatusList = new List.generate(mapsQuizStatus.length, (i) {
    //   return QuizStatus(
    //     problemId: mapsQuizStatus[i]['problemId'],
    //     unansweredFlg: mapsQuizStatus[i]['unansweredFlg'],
    //     correctFlg: mapsQuizStatus[i]['correctFlg'],
    //     favoriteFlg: mapsQuizStatus[i]['favoriteFlg'],
    //   );
    // });
  }
}
