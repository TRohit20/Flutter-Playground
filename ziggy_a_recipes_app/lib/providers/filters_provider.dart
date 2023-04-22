import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ziggy_a_recipes_app/providers/meal_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarianFree, veganFree }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  // Initial State is passed to the super class using initialiser list
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarianFree: false,
          Filter.veganFree: false
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
// We need to give the Generic !!
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarianFree]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.veganFree]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
