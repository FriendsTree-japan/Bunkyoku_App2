import '02_01_QuizQA.dart';

class QuizQ_List {
  Map<String, QuizQ> list = {
    '1': QuizQ(
        QID: '1',
        Picture: 'images/question/que_001.jpg',
        problem: '園内に1km以上の桜並木があることで有名な、神田川沿いに東西に広がる長細い公園は、次のうちどれでしょうか？',
        Select1: '江戸川公園',
        Select2: '礫川公園',
        Select3: '肥後細川庭園',
        Select4: '文京宮下公園',
        PicturePtn: '0'),
    '2': QuizQ(
        QID: '2',
        Picture: 'images/question/que_002.jpg',
        problem:
            '茗荷谷駅近くの林泉寺境内には、ある「めずらしいこと」をされているお地蔵様がいらっしゃいます。その「めずらしいこと」とは次のうちどれでしょうか？',
        Select1: '水をかけられている',
        Select2: '縛られてる',
        Select3: '針を刺されている',
        Select4: '黒く塗られている',
        PicturePtn: '0'),
    '3': QuizQ(
        QID: '3',
        Picture: 'images/question/que_003.jpg',
        problem:
            '四季折々の魅力がある文京区には、「文京花の５大まつり」というお祭りがあります。その花は、さくら、つつじ、あじさい、うめ、あと一つは何でしょうか？',
        Select1: 'きく',
        Select2: 'ひまわり',
        Select3: 'ばら',
        Select4: 'ゆり',
        PicturePtn: '0'),
    '4': QuizQ(
        QID: '4',
        Picture: 'images/question/que_004.jpg',
        problem:
            '本郷給水所の上方にある本郷給水所公苑には、和風庭園と西洋庭園の2つから成り立っています。\nそのうち西洋庭園には、約52種、300株のバラが植えられており、見頃が年2回あるそうです。その見頃とは、5月といつでしょうか？',
        Select1: '7月',
        Select2: '8月',
        Select3: '9月',
        Select4: '10月',
        PicturePtn: '0'),
    '5': QuizQ(
        QID: '5',
        Picture: 'images/question/que_005.jpg',
        problem:
            '約90年以上の歴史がある「本郷 三原堂」（昭和7年 1932年創業）\n時代に合わせ、お菓子を刷新していますが、創業当初からそのままのお菓子があります。それはどれでしょうか？',
        Select1: '大学最中',
        Select2: '本郷焼（どら焼き）',
        Select3: '塩せんべい',
        Select4: '栗まんじゅう',
        PicturePtn: '0'),
    '6': QuizQ(
        QID: '6',
        Picture: 'images/question/que_006.jpg',
        problem: '後楽園と茗荷谷の間の住宅街にある庚申坂。実は、別名もあるそうです。その別名とは何でしょうか？',
        Select1: '葛坂',
        Select2: '鉄砲坂',
        Select3: '切支丹坂',
        Select4: '稲荷坂',
        PicturePtn: '1'),
    '7': QuizQ(
        QID: '7',
        Picture: 'images/question/que_007.jpg',
        problem: '文京区で最も古い公園は、次のうちどれでしょうか？',
        Select1: '大塚公園',
        Select2: '須藤公園',
        Select3: '江戸川公園',
        Select4: '白山公園',
        PicturePtn: '0'),
    '8': QuizQ(
        QID: '8',
        Picture: 'images/question/que_008.jpg',
        problem: '東京10社の一つの白山神社。とあるご利益でも有名ですが、そのご利益とは何でしょうか？',
        Select1: '子宝',
        Select2: '復縁',
        Select3: '商売繁盛',
        Select4: '才能開花',
        PicturePtn: '0'),
    '9': QuizQ(
        QID: '9',
        Picture: 'images/question/que_009.jpg',
        problem:
            '音楽イベントにも使われるホールや区民施設、区役所などの公共機関からなる総合施設、文京区シビックセンター。その25階には展望ラウンジがあります。その展望ラウンジから見れるものはどれでしょうか。',
        Select1: '富士山',
        Select2: '筑波山',
        Select3: 'スカイツリー',
        Select4: '全部',
        PicturePtn: '0'),
    '10': QuizQ(
        QID: '10',
        Picture: 'images/question/que_010.jpg',
        problem: '文京区は自転車のシェアリング事業を営んでいます。その事業で取り扱っている自転車は文京区内だけで何台あるでしょうか？',
        Select1: '100台',
        Select2: '300台',
        Select3: '500台',
        Select4: '800台',
        PicturePtn: '0'),
    '11': QuizQ(
        QID: '11',
        Picture: 'images/question/que_011.jpg',
        problem: '小石川の福聚院にいらっしゃるお地蔵様には、とある食べ物が大量にお供えされています。その食べ物とは何でしょうか？',
        Select1: 'とうがらし',
        Select2: 'そらまめ',
        Select3: 'あずき',
        Select4: 'きゅうり',
        PicturePtn: '0'),
    '12': QuizQ(
        QID: '12',
        Picture: 'images/question/que_012.jpg',
        problem:
            '2019年に文の京都市景観賞のふるさと景観賞を受賞したしろへび坂。その坂上からは建物の狭間にある日本の有名な建物が見えます。それは何でしょうか？',
        Select1: 'スカイツリー',
        Select2: '東京タワー',
        Select3: '六本木ヒルズ',
        Select4: '東京ドーム',
        PicturePtn: '0'),
    '13': QuizQ(
        QID: '13',
        Picture: 'images/question/que_013.jpg',
        problem: '千駄木にある須藤公園には、一般的な公園にはない、ある珍しいものがあります。それは何でしょうか？',
        Select1: 'ひまわり畑',
        Select2: '滝',
        Select3: 'トランポリン',
        Select4: '釣り堀',
        PicturePtn: '0'),
    '14': QuizQ(
        QID: '14',
        Picture: 'images/question/que_014.jpg',
        problem: '本郷三丁目の交差点から40ｍほどに見返り坂・見送り坂という坂があります。その見送る相手とは、次のうち誰でしょうか？',
        Select1: '花婿',
        Select2: '兵士',
        Select3: '罪人',
        Select4: '死人',
        PicturePtn: '0'),
    '15': QuizQ(
        QID: '15',
        Picture: 'images/question/que_015.jpg',
        problem: '東京ドームシティの観覧車40台のうち、8台だけ、とあるものがついています。そのあるものとは何でしょうか？',
        Select1: 'カラオケ',
        Select2: 'ミラーボール',
        Select3: 'プリクラ',
        Select4: '望遠鏡',
        PicturePtn: '0'),
    '16': QuizQ(
        QID: '16',
        Picture: 'images/question/que_016.jpg',
        problem: '本郷三丁目駅の近くにある「本郷弓町のクス」と呼ばれてるクスノキの樹齢は、次のうちどれでしょうか？',
        Select1: '200年',
        Select2: '300年',
        Select3: '500年',
        Select4: '600年',
        PicturePtn: '0'),
    '17': QuizQ(
        QID: '17',
        Picture: 'images/question/que_017.jpg',
        problem: '東京三名園は「小石川庭園（文京区）」「浜離宮恩賜庭園（中央区）」と、あと一つは何でしょうか？',
        Select1: '六義園',
        Select2: '肥後細川庭園',
        Select3: '占春園',
        Select4: '後楽園',
        PicturePtn: '0'),
    '18': QuizQ(
        QID: '18',
        Picture: 'images/question/que_018.jpg',
        problem: '狂言などが上演される能楽堂は、都内にも数カ所ありますが、文京区にある能楽堂の名前は、次のうちどれでしょうか？',
        Select1: '国立能楽堂',
        Select2: '矢来能楽堂',
        Select3: 'セルリアンタワー能楽堂',
        Select4: '宝生能楽堂',
        PicturePtn: '0'),
    '19': QuizQ(
        QID: '19',
        Picture: 'images/question/que_019.jpg',
        problem: '文京区内には様々な駅がありますが、JRの駅はいくつあるでしょうか？',
        Select1: '0駅',
        Select2: '1駅',
        Select3: '2駅',
        Select4: '3駅',
        PicturePtn: '0'),
    '20': QuizQ(
        QID: '20',
        Picture: 'images/question/que_020.jpg',
        problem: '文京区の消防署で、存在しない消防署はどれでしょうか？',
        Select1: '大塚消防署',
        Select2: '本郷消防署',
        Select3: '小石川消防署',
        Select4: 'どれも存在する',
        PicturePtn: '0'),
    '21': QuizQ(
        QID: '21',
        Picture: 'images/question/que_021.jpg',
        problem: '文京区は元々２つの区からできています。\n一つは本郷区ですが、もう一つは何区でしょうか？',
        Select1: '根津区',
        Select2: '白山区',
        Select3: '千駄木区',
        Select4: '小石川区',
        PicturePtn: '0'),
    '22': QuizQ(
        QID: '22',
        Picture: 'images/question/que_022.jpg',
        problem:
            '東京大学の赤門の色は、ある将軍の娘をお嫁として迎え入れる際に赤に塗りつぶされたと言われています。この将軍とは、どの家柄でしょうか？',
        Select1: '北条家',
        Select2: '織田家',
        Select3: '豊臣家',
        Select4: '徳川家',
        PicturePtn: '0'),
    '23': QuizQ(
        QID: '23',
        Picture: 'images/question/que_023.jpg',
        problem: '東京大学内の坂や道には名前がついていますが、実際に存在するものはどれでしょうか？',
        Select1: '合格通り',
        Select2: '秀才通り',
        Select3: '勉強坂',
        Select4: '勤勉坂',
        PicturePtn: '0'),
    '24': QuizQ(
        QID: '24',
        Picture: 'images/question/que_024.jpg',
        problem: '東京大学付近に「おばけ階段」と呼ばれる階段があります。名前に「おばけ」とついている理由は何でしょうか？',
        Select1: '壁のシミがおばけに見える',
        Select2: '影ができない',
        Select3: '体が重くなる',
        Select4: '上りと下りで段数が異なる',
        PicturePtn: '0'),
    '25': QuizQ(
        QID: '25',
        Picture: 'images/question/que_025.jpg',
        problem: '文京区内で唯一、蛍が見れる場所があります。そこはどこでしょうか？',
        Select1: '六義園',
        Select2: 'ホテル椿山荘東京',
        Select3: '須藤公園',
        Select4: '小石川植物園',
        PicturePtn: '0'),
    '26': QuizQ(
        QID: '26',
        Picture: 'images/question/que_026.jpg',
        problem:
            '以前は「新江戸川公園」として呼ばれており、平成29年に改名された、園内に学問所として使われていた建物があるのは次のうちどれでしょう？',
        Select1: '江戸川公園',
        Select2: '肥後細川庭園',
        Select3: '白山公園',
        Select4: '須藤公園',
        PicturePtn: '0'),
    '27': QuizQ(
        QID: '27',
        Picture: 'images/question/que_027.jpg',
        problem: '「ラジオ体操発祥の地」と言われ、銅像も建てられている公園は次のうちどれでしょうか？',
        Select1: '教育の森公園',
        Select2: '大塚公園',
        Select3: '小日向公園',
        Select4: '動坂公園',
        PicturePtn: '0'),
    '28': QuizQ(
        QID: '28',
        Picture: 'images/question/que_028.jpg',
        problem: '区内で唯一、関東の駅百選に選ばれた駅があります。それは何駅でしょうか？',
        Select1: '茗荷谷駅',
        Select2: '東大前駅',
        Select3: '本駒込駅',
        Select4: '後楽園駅',
        PicturePtn: '0'),
    '29': QuizQ(
        QID: '29',
        Picture: 'images/question/que_029.jpg',
        problem: '東京23区で坂の数が最も多い区は何区でしょうか？',
        Select1: '港区',
        Select2: '文京区',
        Select3: '杉並区',
        Select4: '足立区',
        PicturePtn: '0'),
    '30': QuizQ(
        QID: '30',
        Picture: 'images/question/que_030.jpg',
        problem: '夏目漱石が文京区で執筆した処女作は、次のうちどれでしょうか？',
        Select1: 'こころ',
        Select2: '吾輩は猫である',
        Select3: '三四郎',
        Select4: '坊ちゃん',
        PicturePtn: '0'),
    '31': QuizQ(
        QID: '31',
        Picture: 'images/question/que_031.jpg',
        problem: '文京区と姉妹都市を提携しているカイザースラウテルン市があるのは、次のうちどの国でしょうか？',
        Select1: 'ドイツ',
        Select2: 'フランス',
        Select3: 'トルコ',
        Select4: 'オーストリア',
        PicturePtn: '0'),
    '32': QuizQ(
        QID: '32',
        Picture: 'images/question/que_032.jpg',
        problem: '5,000円札に印字されている樋口一葉。彼女の職業は次のうちどれでしょうか？',
        Select1: '小説家',
        Select2: '看護師',
        Select3: '革命家',
        Select4: '建築家',
        PicturePtn: '0'),
    '33': QuizQ(
        QID: '33',
        Picture: 'images/question/que_033.jpg',
        problem: '源覚寺の閻魔さまの別名は、何閻魔でしょうか？',
        Select1: 'あずき閻魔',
        Select2: 'おはぎ閻魔',
        Select3: 'おいなり閻魔',
        Select4: 'こんにゃく閻魔',
        PicturePtn: '0'),
    '34': QuizQ(
        QID: '34',
        Picture: 'images/question/que_034.jpg',
        problem: '東京ドームシティ内にある、大人のための遊べるギャラリー「Gallery AaMo」。\nその「aMo」の由来は何でしょうか？',
        Select1: 'and More',
        Select2: 'amour propre',
        Select3: 'amoral',
        Select4: 'and modern',
        PicturePtn: '0'),
    '35': QuizQ(
        QID: '35',
        Picture: 'images/question/que_035.jpg',
        problem: '江戸時代から続く飴細工の伝統を守り続けているお店が千駄木駅のほど近くにあります。その店舗名は次のうちどれでしょうか？',
        Select1: 'あめ細工 吉原',
        Select2: 'アメ細工 吉原',
        Select3: '飴細工 吉原',
        Select4: '雨細工 吉原',
        PicturePtn: '0'),
    '36': QuizQ(
        QID: '36',
        Picture: 'images/question/que_036.jpg',
        problem:
            '文京区は数多くの文豪が暮らしていた地でもありますが、その文豪の内、文京区内に記念館が建てられているのは次のうち誰でしょうか？',
        Select1: '夏目漱石',
        Select2: '森鴎外',
        Select3: '樋口一葉',
        Select4: '石川啄木',
        PicturePtn: '0'),
    '37': QuizQ(
        QID: '37',
        Picture: 'images/question/que_037.jpg',
        problem: '日本で最も古い植物園である「小石川植物園」。いつの時代に創設されたでしょうか。',
        Select1: '奈良時代',
        Select2: '江戸時代',
        Select3: '明治時代',
        Select4: '大正時代',
        PicturePtn: '0'),
    '38': QuizQ(
        QID: '38',
        Picture: 'images/question/que_038.jpg',
        problem:
            '東洋に関する蔵書・コレクションが展示されている、東洋文庫ミュージアムには、日本一美しいあるものがあると言われています。そのあるものとは何でしょうか？',
        Select1: '本棚',
        Select2: '窓ガラス',
        Select3: '階段',
        Select4: 'トイレ',
        PicturePtn: '0'),
    '39': QuizQ(
        QID: '39',
        Picture: 'images/question/que_039.jpg',
        problem:
            '四季折々の美しい自然が溢れる文京区では、緑化活動のシンボルマークがあります。そのマークには文京区を象徴する2種類の植物がありますが、1つは「いちょう」。もう1つは何でしょうか？',
        Select1: 'うめ',
        Select2: 'さくら',
        Select3: 'つつじ',
        Select4: 'あじさい',
        PicturePtn: '0'),
    '40': QuizQ(
        QID: '40',
        Picture: 'images/question/que_040.jpg',
        problem:
            '文京区コミュニティバスのBーグルに乗ると、文京区を効率的に観光することができます。1回から利用できますが、1日利用することもできます。1日利用する場合の料金はいくらでしょうか？',
        Select1: '300円',
        Select2: '500円',
        Select3: '750円',
        Select4: '1,000円',
        PicturePtn: '0'),
    '41': QuizQ(
        QID: '41',
        Picture: 'images/question/que_041.jpg',
        problem: '千駄木駅から徒歩1分にある須藤公園の池には、「ある動物に注意」という看板が立っています。その動物とは何でしょうか？',
        Select1: 'わに',
        Select2: 'かっぱ',
        Select3: 'きつね',
        Select4: 'たぬき',
        PicturePtn: '0'),
    '42': QuizQ(
        QID: '42',
        Picture: 'images/question/que_042.jpg',
        problem: '肥後細川庭園の庭園様式は、次のうちどれでしょうか？',
        Select1: '池泉舟遊式',
        Select2: '池泉鑑賞式',
        Select3: '池泉回遊式',
        Select4: '池泉中水式',
        PicturePtn: '0'),
    '43': QuizQ(
        QID: '43',
        Picture: 'images/question/que_043.jpg',
        problem: '文京区内では、歴史の教科書にも出てくるような、有名な遺産が発掘されています。それは以下のうち、どれでしょうか？',
        Select1: '縄文土器',
        Select2: '弥生土器',
        Select3: '万葉集',
        Select4: '源氏物語',
        PicturePtn: '0'),
    '44': QuizQ(
        QID: '44',
        Picture: 'images/question/que_044.jpg',
        problem: '湯島天神にいらっしゃる学問の神様は次のうち誰でしょうか？',
        Select1: '菅原道真',
        Select2: '源頼朝',
        Select3: '醍醐天皇',
        Select4: '平清盛',
        PicturePtn: '0'),
    '45': QuizQ(
        QID: '45',
        Picture: 'images/question/que_045.jpg',
        problem: '東京の都心にありながらも、江戸の面影をいまに伝える護国寺。\nその護国寺では、毎月第2土曜日に決まってあるイベントが開催されます。そのイベントとは何でしょうか？',
        Select1: 'ヨガ',
        Select2: '骨董市',
        Select3: '座禅',
        Select4: '住職体験',
        PicturePtn: '0'),
    '46': QuizQ(
        QID: '46',
        Picture: 'images/question/que_046.jpg',
        problem: '「はたらけど はたらけど猶なほわが生活くらし楽にならざり ぢっと手を見る」この有名な詩を読んだ詩人は次のうち誰でしょうか？',
        Select1: '石川啄木',
        Select2: '与謝野晶子',
        Select3: '宮沢賢治',
        Select4: '芥川龍之介',
        PicturePtn: '0'),
    '47': QuizQ(
        QID: '47',
        Picture: 'images/question/que_047.jpg',
        problem: '文京区には、とある小動物しか通れないほど急な坂であることにちなんで名付けられた坂があります。その小動物とは何でしょうか？',
        Select1: '鼠',
        Select2: '蛇',
        Select3: '蛙',
        Select4: '土竜',
        PicturePtn: '0'),
    '48': QuizQ(
        QID: '48',
        Picture: 'images/question/que_048.jpg',
        problem: '庶民から側室までのぼりつめ、玉の輿の語源となった桂昌院。彼女を側室候補として部屋子に任命したのは次のうち誰でしょうか？',
        Select1: '北条政子',
        Select2: '春日局',
        Select3: '崇源院',
        Select4: '桂昌院',
        PicturePtn: '0'),
    '49': QuizQ(
        QID: '49',
        Picture: 'images/question/que_049.jpg',
        problem: '神社に祈願するときに奉納する「絵馬」。この絵馬のほとんどは馬の絵が描かれていますが、湯島天神だけは他の動物が描かれています。その動物とは何でしょうか？',
        Select1: '牛',
        Select2: '豚',
        Select3: '鳥',
        Select4: '羊',
        PicturePtn: '0'),
    '50': QuizQ(
        QID: '50',
        Picture: 'images/question/que_050.jpg',
        problem: '神社に祈願するときに奉納する「絵馬」。この絵馬のほとんどは馬の絵が描かれていますが、湯島天神だけは他の動物が描かれています。その動物とは何でしょうか？',
        Select1: '牛',
        Select2: '豚',
        Select3: '鳥',
        Select4: '羊',
        PicturePtn: '0'),
  };
}
// class QuizQ_List {
//   Map<String, QuizQ> list = {
//     '1': QuizQ(
//         QID: '1',
//         // Picture: 'images/Q076.jpeg',
//         Picture: 'images/tate.jpg',
//         problem:
//             '文京区にはとある小動物しか通れないほど急な坂であることにちなんで名付けられた坂があります。\nその小動物とは何でしょうか？',
//         Select1: '鼠',
//         Select2: '蛇',
//         Select3: '蛙',
//         Select4: '土竜',
//         PicturePtn: '1'),
//     '2': QuizQ(
//         QID: '2',
//         Picture: 'images/yoko.jpg',
//         problem:
//             '神社に祈願するときに奉納する「絵馬」。この絵馬のほとんどは馬の絵が描かれているが、湯島天神だけは他の動物が描かれている。その動物とは何でしょうか?',
//         Select1: '牛',
//         Select2: '豚',
//         Select3: '鳥',
//         Select4: '白ヘビ',
//         PicturePtn: '0'),
//     '3': QuizQ(
//         QID: '3',
//         Picture: 'images/Q003.jpg',
//         problem:
//         '江戸時代から続く飴細工の伝統を守り続けているお店が千駄木駅のほど近くにあります。その店舗名は次のうちどれでしょうか？',
//         Select1: 'あめ細工 吉原',
//         Select2: 'アメ細工 吉原',
//         Select3: '飴細工 吉原',
//         Select4: '雨細工 吉原',
//         PicturePtn: '0  '),
//   };
// }
