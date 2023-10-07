main() {
  // 例外処理の基本
  try {
    int val = division(0);
    print(val);
  } catch (e) {
    print('Errorが発生!! $e');
  } finally {
    print('finall!');
  }

}

int division(int val) {
  try {
    int x = 100 ~/ val;
    return x;
  } catch (e, str) {
    print(e);
    print(str);

    rethrow;
  }
  
}
