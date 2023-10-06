# Dart
* 2011年にGoogleによって発表されたプログラミング言語
* コードの実行パフォーマンスが優れている
* 大規模開発に向いている
* 強力な型推論機能を持っている

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
