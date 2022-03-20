import '02_01_QuizQA.dart';

class QuizQ_List {
  Map<String,QuizQ> list = {
    '1':
    QuizQ(
      QID: '1',
      Picture: 'images/Q076.jpeg',
      problem: '文京区にはとある小動物しか通れないほど急な坂であることにちなんで名付けられた坂があります。\nその小動物とは何でしょうか？',
      Select1: '鼠',
      Select2: '蛇',
      Select3: '蛙',
      Select4: '土竜',
    ),
    '2':
    QuizQ(
      QID: '2',
      Picture: 'images/Q080.jpeg',
      problem: '神社に祈願するときに奉納する「絵馬」。この絵馬のほとんどは馬の絵が描かれているが、湯島天神だけは他の動物が描かれている。その動物とは何でしょうか?',
      Select1: '牛',
      Select2: '豚',
      Select3: '鳥',
      Select4: '白ヘビ',
    ),};
}

//勉強用
// import '02_02_Questuin.dart';
//
// class QuestionList {
//   List<Question> list = [
//     Question(
//       QID: '1',
//       Picture: 'images/FriendsTree.jpg',
//       problem: '下記4つのうちどれでしょうか\nあああ',
//       Select1: 'ねこ',
//       Select2: 'いぬ',
//       Select3: 'たこ',
//       Select4: 'いか',
//     ),
//     Question(
//       QID: '2',
//       Picture: 'images/FriendsTree.jpg',
//       problem: '下記4つのうちどれでしょうか',
//       Select1: 'たぬき',
//       Select2: 'ねこ',
//       Select3: 'きつね',
//       Select4: 'こぶた',
//     ),
//   ];
// }