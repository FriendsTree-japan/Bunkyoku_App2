import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '01_Pages/01_004_Favorite.dart';
import '02_Class/02_04_Size.dart';
import '02_Class/02_05_Color.dart';
import '03_Unity/03_01_SharedPreferences.dart';
import '03_Unity/03_02_SqliteDb.dart';
import '01_Pages/01_001_QuestionList.dart';
import '01_Pages/01_005_Setting.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await SharedPrefs.setInstance();
  await checkFirstLogin();
  runApp(MyApp());
}
Future<void>checkFirstLogin() async{
  String? firstLoginFlg = SharedPrefs.getFirstLoginFlg();
  await QuizStatusDb().getMaxQuizQid();

  if(firstLoginFlg == ''){
    await SharedPrefs.setFirstLoginFlg("0");
    await QuizStatusDb().createData();
  }else{
    if(QuizStatusDb.userMaxQuizQidValue < QuizStatusDb.maxQuizQidValue){
      await QuizStatusDb().updateData();
    }
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin{
  late PageController _pageController;
  int _currentIndex = 0;


  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "クイズ一覧"),
      BottomNavigationBarItem(icon: Icon(Icons.bookmark_outlined),label: "お気に入り"),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: "設定"),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ColorConfig().init(context);
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            QuizeList(),
            Favorite(),
            Setting(),
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConfig.Blue,
        unselectedItemColor: ColorConfig.Black,
      ),
    );
  }
}