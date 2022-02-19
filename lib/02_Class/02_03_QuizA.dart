import '02_01_QuizQA.dart';

class QuizA_List {
  Map<String,QuizA> list = {
    '1':
    QuizA(
      QID: '1',
      Answer: 'ねこ',
      Picture: 'images/Test.jpg',
      Commentary: '解説でございます\n解説でございます',
      Tips: 'いぬ',
    ),
    '2':
    QuizA(
      QID: '2',
      Answer: 'ねこ',
      Picture: 'images/Test.jpg',
      Commentary: '参考情報です\nリンクはこちらから見れます',
      Tips: 'いぬ',
    ),};
}
