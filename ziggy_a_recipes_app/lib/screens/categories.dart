import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/models/category.dart';
import 'package:ziggy_a_recipes_app/screens/meals.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.onToggleMeals, super.key});
  final void Function(Meal meal) onToggleMeals;

  void _selectCategory(BuildContext context, Category category) {
    // Returns a iterable(List) that has only items meet the condition
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: categoryMeals,
        onToggleMealFavorites: onToggleMeals,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Category'),
      ),
      // Builder func is used if you want to build grid dynamically
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // The below is a alternative to using a .map func to map the categories or list of widgets
          for (final category in availableCategories)
            CategoryGridItem(
              category,
              onSelectCategory: () => _selectCategory(context, category),
            )
        ],
      ),
    );
  }
}
