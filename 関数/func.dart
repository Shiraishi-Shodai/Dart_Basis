import 'dart:ffi';
import 'package:meta/meta.dart';

main() {
  const x = 10;

  int testFunction() {
    const y = 20;
    print('$x, $y');
    return x + y;
  }

  // var result = testFunction();
  // print('$result');

  int oneline(a, b) => a + b;

  // int online(a, b) {
  //   return a + b;
  // }

  // print(oneline(1, 2));

  // void
  // void h(String world) {
  //   print('$world');
  // }

  // h("test");

  // // 戻り値の型を省略
  // helloWorld(world) {
  //   print(world.runtimeType);
  //   return 'Hello World';
  // }

  // print(helloWorld("test"));
  // print(helloWorld("test").runtimeType);

  // 戻り値の型を省略
  helloWorld(world) {
    print(world.runtimeType);
  }

  // print(helloWorld("test"));
  // print(helloWorld("test").runtimeType);

// 名前付き任意引数(1)
  void enableFlags({dynamic bold, dynamic hidden}) {
    print('$bold, $hidden');
  }

  // enableFlags(hidden: true);

// 名前付き任意引数(2)
  computeSum({int val1 = 0, int val2 = 0}) {
    return val1 + val2;
  }

  print(computeSum(val1: 3, val2: 5));

  // 名前付き任意引数(3)
  computeSum2({required int val1, int val2 = 0}) {
    return val1 + val2;
  }

  print(computeSum2(val1: 10));

  // []は順位付き任意引数、特定の位置以降の引数を省略可能
  String say(String from, String msg, [String device = 'carrier pigeon', String mod = 'mod']) {
    var result = '$from says $msg with a $device. mod is $mod';
    return result;
  }

  print(say('USA', 'Hello', 'mode'));
}
