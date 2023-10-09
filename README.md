# Dart
* 2011年にGoogleによって発表されたプログラミング言語
* コードの実行パフォーマンスが優れている
* 大規模開発に向いている
* 強力な型推論機能を持っている

## 0 main関数

```
void main(List<String> arguments) {

}
```

- アプリ実行時に最初に実行される関数
- 引き数に任意のコマンドライン引数を持つ

### コマンドライン引数の使用例
```
dart run --enable-asserts main.dart 1 test

main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  print("要素は2です");
  assert(int.parse(arguments[0]) == 1);
  print("0番目の要素は1です");
  assert(arguments[1] == 'test');
  print("0番目の要素はtestです");
}

```
## 1 型について

### 1-1 dynamic型

型を柔軟に変化させるために型推論させないための型  
下のコードではdynamic型の変数jは正常に動くが、var型の変数aは型推論されString型になった後、int型の値を代入しようとしているためエラーになる

```
  dynamic j = 10;
  j = 'a';
  print(j);

  var a = 10;
  a = 'test';
  print(a);
```

### 1-2 ルーン文字

* Unicode の UTF-32 コードポイントを表現する
* \uで文字を指定

```
  Runes i =
      new Runes('\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}');
    <!-- 数値のリストを文字列に変換 -->
  print(new String.fromCharCodes(i));

```
#### 文字集合とコードポイント

* 文字集合: コンピュータが認識できる文字の範囲(Unicode, JIS, KS etc...)
* 文字集合の内その文字が存在する場所

#### UnicodeとUTF

* Unicode : 符号化文字集合
* UTF : 符号化方式

### 1-3 List Set Map

|| List | Set | Map|
| :---: | :---: | :---: | :---: |
| 値の重複 | 可能 | 不可 | 不可 |
| 順序つけ | あり | デフォルトではあり | デフォルトではあり |


## 2 finalとconst

|| final | const |
| :---: | :---: | :---: |
| 値を代入するタイミング | プログラム実行時 | コンパイル時 |
| Listの要素の変更 | 可能 | 不可能 |
| 使用例 | ランダムな値を生成する<br>現在のデバイスの時間を取得する<br>外部APIから取得したデータ | 定数的な値 (例えば、π)<br>静的なリソース (例えば、アイコン、タイトル、項目名)<br>定数的な定数 (例えば、enum) |

constには値はコンパイル値を代入する？
[詳しく](https://qiita.com/uehaj/items/7c07f019e05a743d1022)
```
void main() {
 String x = "check";

 final String b  = x; //エラーにならない  
 const String a  = x; //エラー  
}
```

## 3 制御構文

if, forEach, for, for in, while, do while, switchなどの制御構文が使える  

switchにはラベルという概念がある。下記ではprint('closed');を実行した後、nowClosedラベルを呼び出し、print('NOW_CLOSED');を実行してからswitch文を抜けている  
  
```
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print("closed");
      continue nowClosed;

    nowClosed:
    case 'NOW_CLOSED':
      print('NOW_CLOSED');
      break;
  }
```
ちなみにDart3からはswitch式とやらが追加されたらしい

## 4 関数

### 4-1 基本的な関数の構造
```
<戻り値の型> <関数名>([<引数の型> <引数値>],[<引数の指定>]){
    return <戻り値>;
}

```

### 4-2 引き数と戻り値の型

- 省略: 引き数と戻り値の型を省略した場合はdynamic型として扱われる
- 戻り値の型を省略し、値を返却しなかった場合: NULL型のnullが返される

### 4-3 名前付き任意引数

- {}内に名前付き引き数を指定
- 名前付き任意息数は省略可能
- 省略した場合、nullが設定される

#### 様々な名前付き引き数
```
import 'package:meta/meta.dart';
// (1) 通常形式の引数と名前付き引数の混在
computeSum1(int val1 , { int val2 }){
}
// (2) 省略されたときのデフォルト値の指定
computeSum2({ int val1 = 0, int val2 = 0 }){
}
// (3) 省略されないようにするためのアノテーション指定
computeSum3({ @required int val1, int val2 = 0 }){
}

```

#### 任意引数におけるブレースとブラケットの違い

- ブレース{}: 関数呼び出し時に任意引数の名前を指定する。順不同
- ブラケット[]: 関数呼び出し時に任意引き数の名前を指定しない。引数が定義された順に値を代入

## 5 例外処理

コードを実行した時に発生するエラーに対処すること　　
- データベースに接続できない
- Web APIにアクセスできない
- ファイルのI/Oエラー

### 5-1 例外の詳細を確認する
catchの第1引数eで例外の種類を取得し、catchの第2引数を指定することで例外の詳細を取得

```
try {
  int a = 100 / 0;
  print(a);
} catch (e, str) {
  print(e);
  print(str);
}
```
### 5-2 throw
プログラムに例外が発生したことを知らせる。JavaではJVMに通知する

### 5-3 on句
例外処理をする例外ターゲットを指定(複数可能)
※on句は上から順位にチェックしていくため指定するターゲットはサブクラスからスーパークラスの順に指定すると、具体的な例外の原因を特定しやすい

```
void main() {
  try {
    print('Try One');
    throw FormatException();
    print('Try Two');
  } on FormatException {
    print('On:FormatException');
  } on Exception {
    print('On:Exception');
  } on Error {
    print('On:Error');
  } finally {
    print('Finally');
  }
  print('After Finally');
}
```

catchとの併用も可能

```
try {
  print('Try One');
  throw FormatException();
} on FormatException catch(e, str) {
  print('On: FormatException');
  print(e);
  print(str);
}
```

[on句を使用しないcatchは良くないらしい](https://dart.dev/tools/linter-rules/avoid_catches_without_on_clauses)

### 5-4 rethrow
例外の処理を呼び出し元に委ねたい場合に使用できる便利な機能。catch句の中で使用
- rethrow は、catch ブロックでキャッチした例外を再スローします。
- rethrow を使用すると、例外の処理を呼び出し元に委ねることができます。
- rethrow を使用すると、例外がスタックトレースを保持したまま再スローされます。

## 6 クラス
- NULLを許可しないインスタンス変数は定義時価かコンストラクタで初期化が必要
- 全てのインスタンス変数は内部的にgetterとsetterを持っている
- finalで宣言されたインスタンス変数はsetterを持たない
- constはstaticとしてのみインスタンス変数として宣言でき、finalはコンストラクタ内か宣言時に初期化する必要がある
- 内部的にクラスは空のコンストラクタを持っている
- クラスのコンストラクタを明示的に定義していない場合、空のコンストラクタは自動的に適用される
- コンストラクタを複数指定する場合はコンストラクタの名前が重複しないようにする
```
  Person.empty();
  Person(this.name);
```
### 6-1 クラスの基本構成

```
class クラス名 {
   //インスタンス変数
   //コンストラクタ
   //インスタンスメソッド
}
```

### 6-2 継承
子クラスのコンストラクタで親クラスのコンストラクタを呼び出す必要がある。

#### 継承したインスタンス変数はコンストラクタ生成時にthis.変数名として使えない?下のコードではname変数を持つPersonを継承しているが、コンストラクタの引数ではthis.nameとして書くと、nameが存在しませんとエラーになる

#### @overrideで親クラスのメソッドをオーバーライド
```
class Employee extends Person {
  String department;

  Employee(String name, this.department) : super(name) {
    print(name);
  }
}
```

### 6-3 抽象クラス(継承されることを前提としたクラス)
- 抽象クラスはインスタンス化が禁止されている
- 抽象クラスを継承したクラスでは抽象クラスで定義した抽象メソッドをオーバーライドしなければいけない
- 普通のメソッドは必ずしもオーバーライドする必要がない
- 抽象メソッドは{}を書かない

```
abstract class Animal {
  void walk()

  void run() {
    print('走るよー');
  }
}
```

### 6-4 暗黙的インターフェース
- Dartにインターフェースというワードは存在しない
- 全てのメソッドは抽象メソッドである
- 基本的にフィールドを1つも持たない
- implementで読み込んだクラスのインスタンス変数やメソッドを全て実装する必要がある


### 6-5 Mixin
- サブクラスを作らずにクラスを拡張する仕組み
- onをつけることで特定のクラスを継承したクラスのみ拡張させることも出来る

下の例ではPersonクラスを実装したクラスのみAccountingによる拡張を許可している
```
mixin Accounting on Person {
  void fileTaxies() {
    print("仕事やっておきました");
  }
}
```
[参考ページ](https://resocoder.com/2019/07/21/mixins-in-dart-understand-dart-flutter-fundamentals-tutorial/#t-1696831052868)

### 6-6 static
- クラスのプロパティ/メソッドをインスタンス化せずに使用できるようにしてくれるもの
- 各インスタンスで共有したい情報に使うと便利
- 呼び出すときはインスタンス変数名からではなく、クラス名から呼び出す
  
```
class Person {
  static const initialAge = 0;
  static void printFeature() {
    print('Hello Person');
  }
}

void main() {
  print(Person.initialAge); //〇
  var p = Person();
  print(p.initialAge); //✖
}
```
## その他
### pubspec.yamlファイル

Flutterのプロジェクト設定ファイル
[pubspce.yamlファイルの書き方](https://qiita.com/kurun_pan/items/76e13bfd03fd3dec1e27)

### 静的スコープと動的スコープ

- 静的スコープ: 変数の定義時にその変数の有効範囲が決定
- 動的スコープ: 変数の使用場所によって有効範囲が決定(子側から親側の変数を参照出来る)

```
A {
  print x
}

B {
  var x
  call A  // Aの中からxを参照することができる
}

C {
  var y
  call A  // Aの中からxを参照することはできない
}

```