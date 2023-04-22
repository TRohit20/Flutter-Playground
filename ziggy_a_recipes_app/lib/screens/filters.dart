import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // body: WillPopScope(
      //   // A utility widget that takes Fututes
      //   onWillPop: () async {
      //     ref.read(filtersProvider.notifier).setFilters({
      //       Filter.glutenFree: _gluttenFilterStatus,
      //       Filter.lactoseFree: _lactoseFilterStatus,
      //       Filter.vegetarianFree: _vegetarianFilterStatus,
      //       Filter.veganFree: _veganFilterStatus,
      //     });
      //     // Navigator.of(context).pop();
      //     return true;
      //   },
      body: Column(children: [
        SwitchListTile(
          value: activeFilters[Filter.glutenFree]!,
          onChanged: (statusChange) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, statusChange);
          },
          title: Text(
            'Gluten-Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Collection of meals that are Gluten-FREE',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.lactoseFree]!,
          onChanged: (statusChange) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, statusChange);
          },
          title: Text(
            'Lactose-Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Collection of meals that are Lactose-FREE',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.vegetarianFree]!,
          onChanged: (statusChange) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarianFree, statusChange);
          },
          title: Text(
            'Vegetarian-Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Collection of meals that are Vegetarian-FREE',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.veganFree]!,
          onChanged: (statusChange) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.veganFree, statusChange);
          },
          title: Text(
            'Vegan-Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Collection of meals that are Vegan-FREE',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
    );
  }
}
