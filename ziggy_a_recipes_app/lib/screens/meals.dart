import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({required this.title, required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    final bodyContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return Text(meals[index].title);
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
