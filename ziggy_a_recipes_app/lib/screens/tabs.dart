import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ziggy_a_recipes_app/providers/favorites_provider.dart';
import 'package:ziggy_a_recipes_app/providers/meal_provider.dart';
import 'package:ziggy_a_recipes_app/screens/categories.dart';
import 'package:ziggy_a_recipes_app/screens/filters.dart';
import 'package:ziggy_a_recipes_app/screens/meals.dart';
import 'package:ziggy_a_recipes_app/widgets/main_drawer.dart';

import '../providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTabIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSelectTab(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context)
          .push<Map<Filter, bool>>(CupertinoPageRoute(builder: (ctx) {
        return const FiltersScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final filteredMeals = meals.where((meal) {
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

    final favouriteMeals = ref.watch(favouriteMealsProvider);

    final isPlatformIOS = Platform.isIOS;

    Widget activePage = CategoriesScreen(
      filteredMeals: filteredMeals,
    );
    String selectedPageName = 'Categories';

    if (_selectedTabIndex == 1) {
      activePage = MealsScreen(
        title: 'Favorites',
        meals: favouriteMeals,
      );
      selectedPageName = 'Favorites';
    }

    if (isPlatformIOS && _selectedTabIndex == 2) {
      activePage = const FiltersScreen();
    }
    selectedPageName = 'Filters';
    return isPlatformIOS
        ? CupertinoTabScaffold(
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) => activePage,
              );
            },
            tabBar: CupertinoTabBar(
                currentIndex: _selectedTabIndex,
                onTap: _selectPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.set_meal_outlined), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star_border), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Filters')
                ]),
          )
        : Scaffold(
            drawer: MainDrawer(onSelectTab: _onSelectTab),
            appBar: AppBar(
              title: Text(selectedPageName),
            ),
            body: activePage,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedTabIndex,
                onTap: _selectPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.set_meal_outlined), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star_border), label: 'Favorites'),
                ]),
          );
  }
}
