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
  }

  static String? getFirstLoginFlg() {
    String? firstLoginFlg = prefsInstance!.getString('firstLoginFlg') ?? '';
    return firstLoginFlg;
  }
}