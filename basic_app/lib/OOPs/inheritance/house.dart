import 'dart:math';

class House {
  double? length;
  double? width;
  double? squareFeet;

  House(double? length, double? width, double? squareFeet) {
    this.length = length;
    width = width;
    squareFeet = squareFeet;
  }

  set setLength(double length) {
    this.length = length;
  }

// Factory Constructor
  factory House.random() {
    return House(10, 12, 1243);
  }

// Custom Operator or Overriding
  @override
  bool operator ==(covariant House other) => other.length == length;

  @override
  int get hashCode => length.hashCode;
}

// Extensions
// Use them sparsely(Dense and care), they have limitations, Use when you really ned it
extension Destroy on House {
  void destroy() {
    print('The functionality is to collapse a building to build a new one');
  }
}

extension Example on House {
  double? get getLength => this.length;
}
