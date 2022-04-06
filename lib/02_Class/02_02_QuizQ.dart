import '02_01_QuizQA.dart';

class QuizQ_List {
  Map<String, QuizQ> list = {
    '1': QuizQ(
        QID: '1',
        // Picture: 'images/Q076.jpeg',
        Picture: 'images/tate.jpg',
        problem:
            '文京区にはとある小動物しか通れないほど急な坂であることにちなんで名付けられた坂があります。\nその小動物とは何でしょうか？',
        Select1: '鼠',
        Select2: '蛇',
        Select3: '蛙',
        Select4: '土竜',
        PicturePtn: '1'),
    '2': QuizQ(
        QID: '2',
        Picture: 'images/yoko.jpg',
        problem:
            '神社に祈願するときに奉納する「絵馬」。この絵馬のほとんどは馬の絵が描かれているが、湯島天神だけは他の動物が描かれている。その動物とは何でしょうか?',
        Select1: '牛',
        Select2: '豚',
        Select3: '鳥',
        Select4: '白ヘビ',
        PicturePtn: '0'),
    '3': QuizQ(
        QID: '3',
        Picture: 'images/Q003.jpg',
        problem:
        '江戸時代から続く飴細工の伝統を守り続けているお店が千駄木駅のほど近くにあります。その店舗名は次のうちどれでしょうか？',
        Select1: 'あめ細工 吉原',
        Select2: 'アメ細工 吉原',
        Select3: '飴細工 吉原',
        Select4: '雨細工 吉原',
        PicturePtn: '0  '),
  };
}
