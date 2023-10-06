void main() {
  // print('Hello World');

// -------------変数宣言-------------

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ["Jupiter", "Saturn", "Uranus", "Neptune"];
  // 辞書型を宣言
  var image = {
    'tags': ['saturn'],
    'url': '"C:/Users/shodai/Pictures/Android/profile_picture.png"'
  };

  // print(flybyObjects[0]);
  // print(image['tags']);
  // print(image['url']);

  // 変数の埋め込み
  // print('変数の埋め込み、$name');

  // 明示的な型宣言変数

  int b = 10;
  double c = 12.3;
  String d = 'abc';
  bool e = true;
  // print('$b, $c, $d, $e');

  List f = [1, 2, 3]; //配列
  f.add(4);
  f.add(4);
  // print('$f, ${f.length}, ${f[0]}');

  Set g = {'a', 'b', 'c'};
  g.add('d');
  g.add('d');
  // print('$g, ${g.length}, ${g.first}');
  // print('$g, ${g.length}, ${g.toList()[1]}');
  // print(g.elementAt(1));

  Runes i =
      new Runes('\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}');

  print(new String.fromCharCodes(i));

  Runes rune = new Runes('\u{1F606}');
  print(new String.fromCharCodes(rune));

  dynamic j = 10;
  j = 'a';
  print(j);

  // var a = 10;
  // a = 'test';
  // print(a);

}
