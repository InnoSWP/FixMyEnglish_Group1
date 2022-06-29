class Sentence {
  String text;
  String error;
  String suggestion;
  String lable;
  Sentence({required this.lable,required this.text, this.error = '', required this.suggestion});
}
