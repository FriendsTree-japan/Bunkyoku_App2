import 'package:bunkyoku_app2/01_Pages/01_004_Favorite.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '01_Pages/01_004_Favorite.dart';
import '01_Pages/01_004_Favorite.dart';
import '02_Class/02_04_Size.dart';
import '02_Class/02_05_Color.dart';
import '02_Class/02_06_QuizStatus.dart';
import '03_Unity/03_01_SharedPreferences.dart';
import '03_Unity/03_02_SqliteDb.dart';
import '01_Pages/01_001_QuestionList.dart';
import '01_Pages/01_005_Setting.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await SharedPrefs.setInstance();
  await checkFirstLogin();
  runApp(MyApp());
}
Future<void>checkFirstLogin() async{
  String? firstLoginFlg = SharedPrefs.getFirstLoginFlg();
  print(firstLoginFlg);

  if(firstLoginFlg == ''|| firstLoginFlg == '0'){
    await SharedPrefs.setFirstLoginFlg("0");
    await QuizStatusDb().createData();
  }else{
    await QuizStatusDb().getMaxQuizQid();
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
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin{
  late PageController _pageController;
  int _currentIndex = 0;
  int _zenIndex = 0;
  static  Future<List<QuizStatus>> favoriteList = QuizStatusDb().getFavoriteDataList();

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: _currentIndex == 0 ? Icon(Icons.home): Icon(Icons.home_outlined),label: "ホーム"),
      BottomNavigationBarItem(icon: _currentIndex == 1 ? Icon(Icons.bookmark ):Icon(Icons.bookmark_outline_outlined),label: "お気に入り"),
      BottomNavigationBarItem(icon: _currentIndex == 2 ? Icon(Icons.settings):Icon(Icons.settings_outlined),label: "設定"),
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
    ColorConfig().init(context);
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) async {
            if(index == 1 && _zenIndex != 1){
              await dataKoushin();
              _zenIndex = index;
            }else if(index != 1 && _zenIndex == 1){
              List<QuizStatus> favoriteListWk = await favoriteList;
              await QuizStatusDb().updateFavoriteListData(favoriteListWk);
              await dataKoushin();
              _zenIndex = index;
            }
            _zenIndex = index;
            setState(()  {
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
        selectedItemColor: ColorConfig.Black,
        unselectedItemColor: ColorConfig.Black,
      ),
    );
  }
  dataKoushin(){
    favoriteList = QuizStatusDb().getFavoriteDataList();
  }
}