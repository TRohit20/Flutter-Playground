import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/screens/categories.dart';
import 'package:ziggy_a_recipes_app/screens/filters.dart';
import 'package:ziggy_a_recipes_app/screens/meals.dart';
import 'package:ziggy_a_recipes_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showToggleMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealsToFavorites(Meal meal) {
    // Check if the meal already exists
    final isExisting = _favoriteMeals.contains(meal);

    if (!isExisting) {
      setState(() {
        _favoriteMeals.add(meal);
        _showToggleMessage('Meal added to Favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.remove(meal);
        _showToggleMessage('Meal removed from Favorites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSelectTab(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) {
        return const FiltersScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPlatformIOS = Platform.isIOS;

    Widget activePage = CategoriesScreen(
      onToggleMeals: _toggleMealsToFavorites,
    );
    String selectedPageName = 'Categories';

    if (_selectedTabIndex == 1) {
      activePage = MealsScreen(
        title: 'Favorites',
        meals: _favoriteMeals,
        onToggleMealFavorites: _toggleMealsToFavorites,
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
