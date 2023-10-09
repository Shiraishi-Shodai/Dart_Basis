abstract class Animal {
  void walk();

  void run() {
    print('走るよー');
  }
}

class Dog extends Animal {
  void walk() {
    print('犬が歩きます');
  }
}
