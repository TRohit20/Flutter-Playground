import 'package:basic_app/OOPs/inheritance/house.dart';

class CustomHouse extends House {
  double? rooms;

  CustomHouse(double? length, double? width, double? squareFeet, double? rooms)
      : super(10, 120, 1234) {
    this.rooms = rooms;
  }
}
