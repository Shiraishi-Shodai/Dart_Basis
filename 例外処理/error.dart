class TestError extends Error {
  final String msg;
  TestError(this.msg);

  @override
  String toString() => msg;
}

main() {
  try {
    throw TestError('Test Error');
  } catch (e) {
    print('Catch');
    print(e);
  } finally {
    print('Finally');
  }
}
