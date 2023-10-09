import 'class.dart';

void main() {
  var e = Employee("山田", "逆夢");
  // print(e.runtimeType);
  e.introduce();
}

class Employee extends Person {
  String department;

  Employee(String name, this.department) : super(name) {
    // print(name);
  }

  @override
  void introduce() {
    super.introduce();
    print('\n');
    // TODO: implement introduce
    age = 20;
    print('私は${this.runtimeType}クラスです');
    print('私の名前は$nameです。年齢は$age歳です。$addressに住んでいます');
  }
}
