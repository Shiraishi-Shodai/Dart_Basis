void main() {
  final taro = Person("山田");
  // taro.age = 10;
  taro.address = '愛媛';

  taro.introduce();
  // print(taro.name);
  // print(taro.age);
  // print(taro.address);

  // taro.name = 'hhh';  //finalのインスタンス変数でsetterを使おうとしているのでエラーになる
}

class Person {
  int? age;
  final String name;
  String address = '東京都';
  
  // Person.empty();
  Person(this.name);

  void introduce() {
    print('私はPersonクラスです');
    print('私の名前は$nameです。年齢は$age歳です。$addressに住んでいます');
  }
}
