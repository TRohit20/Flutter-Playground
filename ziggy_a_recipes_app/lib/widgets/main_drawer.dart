import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/widgets/drawer_items.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectTab;

  const MainDrawer({super.key, required this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.7)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Ziggy App',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )),
        DrawerItem(
          title: 'Meals',
          onSelectTab: onSelectTab,
        ),
        DrawerItem(
          title: 'Filters',
          onSelectTab: onSelectTab,
        )
      ]),
    );
  }
}
