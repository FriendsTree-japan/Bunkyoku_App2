import '02_01_QuizQA.dart';

class QuizQ_List {
  Map<String,QuizQ> list = {
    '1':
    QuizQ(
      QID: '1',
      Picture: 'images/Test.jpg',
      problem: '下記4つのうちどれでしょうか',
      Select1: 'ねこ',
      Select2: 'いぬ',
      Select3: 'たこ',
      Select4: 'いか',
    ),
    '2':
    QuizQ(
      QID: '2',
      Picture: 'images/Test.jpg',
      problem: '下記4つのうちどれでしょうか',
      Select1: 'たぬき',
      Select2: 'ねこ',
      Select3: 'きつね',
      Select4: 'こぶた',
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