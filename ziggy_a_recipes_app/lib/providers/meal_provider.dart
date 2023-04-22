import 'package:riverpod/riverpod.dart';

import '../data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
