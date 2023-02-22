Future<int> exampleOfFuture(int a) {
  return Future.delayed(Duration(seconds: 10), () {
    return a * 3;
  });
}

// Streams
Stream<int> getNumbers() {
  return Stream.periodic(Duration(seconds: 3), (value) {
    return value * 3;
  });
}
