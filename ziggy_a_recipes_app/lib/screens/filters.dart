import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ziggy_a_recipes_app/models/filter_item.dart';

import '../providers/filters_provider.dart';
// import 'package:ziggy_a_recipes_app/screens/tabs.dart';
// import 'package:ziggy_a_recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FiltersScreen> {
  var _gluttenFilterStatus = false;
  var _lactoseFilterStatus = false;
  var _vegetarianFilterStatus = false;
  var _veganFilterStatus = false;

  @override
  void initState() {
    super.initState();
    final filterStatus = ref.read(filtersProvider);
    _gluttenFilterStatus = filterStatus[Filter.glutenFree]!;
    _lactoseFilterStatus = filterStatus[Filter.lactoseFree]!;
    _vegetarianFilterStatus = filterStatus[Filter.vegetarianFree]!;
    _veganFilterStatus = filterStatus[Filter.veganFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(child: MainDrawer(
      //   onSelectTab: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'Meals') {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (ctx) => TabsScreen(),
      //       ));
      //     }
      //   },
      // )),
      appBar: AppBar(title: const Text('Your Filters')),
      body: WillPopScope(
        // A utility widget that takes Fututes
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _gluttenFilterStatus,
            Filter.lactoseFree: _lactoseFilterStatus,
            Filter.vegetarianFree: _vegetarianFilterStatus,
            Filter.veganFree: _veganFilterStatus,
          });
          // Navigator.of(context).pop();
          return true;
        },
        child: Column(children: [
          FilterItem(
            filterStatus: _gluttenFilterStatus,
            title: 'Glutten-Free',
          ),
          FilterItem(
            filterStatus: _gluttenFilterStatus,
            title: 'Lactose-Free',
          ),
          FilterItem(
            filterStatus: _gluttenFilterStatus,
            title: 'Vegetarian-Free',
          ),
          FilterItem(
            filterStatus: _gluttenFilterStatus,
            title: 'Vegan-Free',
          ),
        ]),
      ),
    );
  }
}
