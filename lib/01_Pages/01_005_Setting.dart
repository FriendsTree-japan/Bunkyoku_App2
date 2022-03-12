import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bunkyoku_app2/02_Class/02_04_Size.dart';
import 'package:bunkyoku_app2/02_Class/02_05_Color.dart';
import 'package:bunkyoku_app2/03_Unity/03_03_UrlMove.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ColorConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
        backgroundColor: ColorConfig.Blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('広告をやめる' ,style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showLicensePage(
                context: context,
                applicationName: '文京区クイズアプリ',
                applicationVersion: '1.0.0',
              );
            },
            child: const Text('ライセンス',style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              UrlMove().UrlMoving('https://dented-handball-204.notion.site/0fe2fc1cf0ca465abdb85616658c9106');
              // _RulesURL();
            },
            child: const Text('利用規約',style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              UrlMove().UrlMoving('https://dented-handball-204.notion.site/0fe2fc1cf0ca465abdb85616658c9106');
              // _FAQURL();
            },
            child: const Text('問い合わせ',style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              UrlMove().UrlMoving('https://dented-handball-204.notion.site/0fe2fc1cf0ca465abdb85616658c9106');
              //'https://dented-handball-204.notion.site/0fe2fc1cf0ca465abdb85616658c9106'
              // _FriendsTreeURL();
            },
            child: const Text('Follow us!!',style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
