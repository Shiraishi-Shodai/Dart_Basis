main() {
  try {
    print('Try One');
    throw FormatException();
    print('Try Two');
  } on FormatException catch (e, str) {
    print('On: FormatException');
    print(e);
    print(str);
  } on Exception {
    print("On: Exception");
  } on Error {
    print("On: Error");
  } finally {
    print('Finally');
  }
  print('After Finally');
}
