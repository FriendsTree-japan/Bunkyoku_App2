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

    if(firstLoginFlg =="0") {
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
}