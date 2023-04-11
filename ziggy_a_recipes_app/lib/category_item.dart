import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color colour;
  final String id;

  CategoryItem(this.id, this.title, this.colour);

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) {
      return CategoryMealsScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colour.withOpacity(0.7), colour],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
