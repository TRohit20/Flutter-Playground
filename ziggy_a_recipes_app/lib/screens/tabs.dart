import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ziggy_a_recipes_app/screens/categories.dart';
import 'package:ziggy_a_recipes_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    // String selectedPageName = 'Categories';

    if (_selectedTabIndex == 1) {
      activePage = MealsScreen(
        title: 'Favorites',
        meals: [],
      );
      // selectedPageName = 'Favorites';
    }
    return CupertinoTabScaffold(
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
          ]),
    );
  }
}
