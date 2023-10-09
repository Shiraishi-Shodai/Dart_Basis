mixin Accounting on Person {
  void fileTaxies() {
    print("仕事やっておきました");
  }
}

abstract class Person {
  int? age;
  final String name;
  String address = '東京都';

  // Person.empty();
  Person(this.name);

  void introduce();
}

class Animal {
  final String name;
  final String type;

  Animal(this.name, this.type);

  void purr() {
    print('$nameは$typeと鳴きます');
  }
}

class Engineer extends Person with Accounting {
  Engineer(String name) : super(name);
  @override
  void introduce() {
    print('私はEngineerクラスです');
    print('私の名前は$nameです。年齢は$age歳です。$addressに住んでいます');
  }
}

void main() {
  var p = Engineer("太郎");
  p.introduce();
  p.fileTaxies();
}
