import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/widgets/meal_item.dart';

import '../models/meal.dart';
import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleMealFavorites;

  const MealsScreen(
      {required this.onToggleMealFavorites,
      required this.title,
      required this.meals,
      super.key});

  void onMealSelected(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(
        meal: meal,
        onToggleMealFavorites: onToggleMealFavorites,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final bodyContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) => onMealSelected(context, meal),
          );
        });

    if (meals.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'No meals found',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.5)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try changing your filters',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.5)),
          )
        ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: bodyContent,
    );
  }
}
