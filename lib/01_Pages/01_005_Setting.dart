import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_03_UrlMove.dart';
import 'package:flutter/cupertino.dart';

import '../03_Unity/03_01_SharedPreferences.dart';

class Setting extends StatefulWidget {
  static bool? soundFlg;

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    ColorConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
        backgroundColor: ColorConfig.Green,
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: ColorConfig.SkyBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('利用規約',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            onTap: () {
              UrlMove().UrlMoving(
                  'https://dented-handball-204.notion.site/04dc826e23724da68deadd89078285ef');
              // _RulesURL();
            },
          ),
          ListTile(
            title: Text('問い合わせ',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            onTap: () {
              UrlMove().UrlMoving(
                  'https://dented-handball-204.notion.site/6d997f641a524b338b7326fd842cc8a0');
              // _FAQURL();
            },
          ),
          ListTile(
            title: Text('Follow us!!',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            onTap: () {
              UrlMove().UrlMoving(
                  'https://twitter.com/StreeFriend?t=dyuXC4141UOl_52xV8X2dw&s=06');
              //'https://dented-handball-204.notion.site/0fe2fc1cf0ca465abdb85616658c9106'
              // _FriendsTreeURL();
            },
          ),
          ListTile(
            title: Text('ライセンス', style: TextStyle(fontSize: 20, color: Colors.black)),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: '文京区クイズアプリ',
                applicationVersion: '1.0.0',
              );
            },
          ),
          ListTile(
            title: Text("音量設定（OFF/ON）",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            trailing: CupertinoSwitch(
              value: Setting.soundFlg!,
              onChanged: (bool? value) {
                setState(() {
                  Setting.soundFlg = value ?? true;
                  SharedPrefs.setSoundFlg(Setting.soundFlg!);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
