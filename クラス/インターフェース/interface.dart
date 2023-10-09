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

class Employee implements Person {
  int? age;
  final String name;
  String address = '東京都';
  String department;

  Employee(this.name, this.department) {
    // print(name);
  }

  void introduce() {
    // TODO: implement introduce
    age = 20;
    print('私は${this.runtimeType}クラスです');
    print('私の名前は$nameです。年齢は$age歳です。$addressに住んでいます');
  }
}
