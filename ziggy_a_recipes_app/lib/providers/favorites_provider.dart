import 'package:riverpod/riverpod.dart';
import 'package:ziggy_a_recipes_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Initialising the value of List using the Constructor
  FavouriteMealsNotifier() : super([]);

  void togglingFavouriteMeals(Meal meal) {
    // Data existing cannot be modified, only new ones are created
    final isMealFavourite = state.contains(meal);

    if (isMealFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
