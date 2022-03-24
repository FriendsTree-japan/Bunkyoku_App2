class QuizQ{
  late String QID;
  late String Picture;
  late String problem;
  late String Select1;
  late String Select2;
  late String Select3;
  late String Select4;
  QuizQ({required this.QID,required this.Picture,required this.problem,
    required this.Select1,required this.Select2,required this.Select3,required this.Select4});
}

class QuizA{
  late String QID;
  late String Answer;
  late String Picture;
  late String Commentary;
  late String Tips;
  late String URL;
  late String CreateDate;
  QuizA({required this.QID,required this.Answer,required this.Picture,
    required this.Commentary,required this.Tips,required this.URL,required this.CreateDate});
}

//lateは箱だけ用意して値を後で入れても大丈夫という意味。ただしrequred（入力必須）を必要がある。