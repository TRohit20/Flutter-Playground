import 'dart:ffi';

import 'category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.quantity});
}
