class Questions {
  String image;
  int answerResult;
  List<String> options;

  Questions({String q, int a, List<String> o}) {
    this.image = q;
    this.answerResult = a;
    this.options = o;
  }
}
