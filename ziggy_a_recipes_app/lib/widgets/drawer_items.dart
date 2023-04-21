import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final void Function(String identifier) onSelectTab;

  const DrawerItem({required this.title, required this.onSelectTab, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.settings,
        size: 24,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, fontSize: 22),
      ),
      onTap: () {
        onSelectTab(title);
      },
    );
  }
}
