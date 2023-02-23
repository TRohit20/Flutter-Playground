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

// Synchronous Generators
Iterable<int> syncGenerator() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// Asynchronous Generators
Stream<Iterable<int>> asyncGenerators() async* {
  yield {1, 2, 3};
  yield {325, 2425, 4};
}
