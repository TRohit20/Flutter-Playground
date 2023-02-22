Future<int> exampleOfFuture(int a) {
  return Future.delayed(Duration(seconds: 10), () {
    return a * 3;
  });
}
