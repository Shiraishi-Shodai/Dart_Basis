class Person {
  static const initialAge = 0;
  static void printFeature() {
    print('Hello Person');
  }
}

void main() {
  print(Person.initialAge);
  Person.printFeature();
}
