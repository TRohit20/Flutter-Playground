import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/category_item.dart';
import 'package:ziggy_a_recipes_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Ziggy',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: dummyCategories
              .map((categoryData) => CategoryItem(
                  categoryData.id, categoryData.title, categoryData.color))
              .toList()),
    );
  }
}
