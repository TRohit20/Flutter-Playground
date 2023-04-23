import 'dart:ui';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  junk,
  other
}

class Category {
  final String title;
  final Color color;

  const Category(this.title, this.color);
}
