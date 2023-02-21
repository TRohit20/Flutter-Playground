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

// Factory Constructor
  factory House.random() {
    return House(10, 12, 1243);
  }
}
