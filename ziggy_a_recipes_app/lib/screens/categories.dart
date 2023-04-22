import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/models/category.dart';
import 'package:ziggy_a_recipes_app/screens/meals.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> filteredMeals;

  const CategoriesScreen({required this.filteredMeals, super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _explicitAnimationController;

  @override
  void initState() {
    super.initState();

    _explicitAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _explicitAnimationController.forward();
  }

  @override
  void dispose() {
    _explicitAnimationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    // Returns a iterable(List) that has only items meet the condition
    final categoryMeals = widget.filteredMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: categoryMeals,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Category'),
      ),
      // Builder func is used if you want to build grid dynamically
      body: AnimatedBuilder(
        animation: _explicitAnimationController,
        child: GridView(
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
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.4),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _explicitAnimationController, curve: Curves.easeInOut)),
            child: child,
          );
        },
      ),
    );
  }
}
