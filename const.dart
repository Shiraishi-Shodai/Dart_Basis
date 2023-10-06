  void main() {

// -------------定数-------------

    const String conStr = "const";
    final String fiStr = "final";

    print(conStr);
    print(fiStr);

    const foo = [1, 2, 3];
    final goo = [1, 2, 3];

    // foo[0] = 10;
    goo[0] = 10;

    print(foo);
    print(goo);
  }
  
