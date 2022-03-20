import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static SharedPreferences ? prefsInstance;

  static Future<void> setInstance() async{
    if(prefsInstance == null) {
      prefsInstance = await SharedPreferences.getInstance();
      print('インスタンス生成完了');
    }
  }


  static Future<void> setFirstLoginFlg(String setFlg) async{
    await prefsInstance!.setString('firstLoginFlg', setFlg);
    //広告表示回数を制御するフラグに初期値0をセットする
    await prefsInstance!.setInt('AdmCtlFlg', 0);
  }

  static String? getFirstLoginFlg() {
    String? firstLoginFlg = prefsInstance!.getString('firstLoginFlg') ?? '';
    return firstLoginFlg;
  }

  static Future<int> admCtlMethod() async{
    int zenAdmCtlFlg = prefsInstance!.getInt('AdmCtlFlg') ?? 0;
    if(zenAdmCtlFlg == 5){
      zenAdmCtlFlg = 0;
    }
    int touAdmCtlFlg = zenAdmCtlFlg + 1;
    await prefsInstance!.setInt('AdmCtlFlg', touAdmCtlFlg);
    print(touAdmCtlFlg);
    return touAdmCtlFlg;
  }
}