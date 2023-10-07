void main() {
  try {
    // 例外をスロー
    throw Exception("例外が発生しました");
  } catch (e) {
    // 例外をキャッチ
    print(e); // Exception: 例外が発生しました
    rethrow;
  }
}
