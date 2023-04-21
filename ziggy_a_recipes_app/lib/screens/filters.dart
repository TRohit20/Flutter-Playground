import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/models/filter_item.dart';
// import 'package:ziggy_a_recipes_app/screens/tabs.dart';
// import 'package:ziggy_a_recipes_app/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarianFree, veganFree }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilterStatus;

  const FiltersScreen({required this.currentFilterStatus, super.key});

  @override
  State<FiltersScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  var _gluttenFilterStatus = false;
  var _lactoseFilterStatus = false;
  var _vegetarianFilterStatus = false;
  var _veganFilterStatus = false;

  @override
  void initState() {
    super.initState();
    _gluttenFilterStatus = widget.currentFilterStatus[Filter.glutenFree]!;
    _lactoseFilterStatus = widget.currentFilterStatus[Filter.lactoseFree]!;
    _vegetarianFilterStatus =
        widget.currentFilterStatus[Filter.vegetarianFree]!;
    _veganFilterStatus = widget.currentFilterStatus[Filter.veganFree]!;
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
          Navigator.of(context).pop({
            Filter.glutenFree: _gluttenFilterStatus,
            Filter.lactoseFree: _lactoseFilterStatus,
            Filter.vegetarianFree: _vegetarianFilterStatus,
            Filter.veganFree: _veganFilterStatus,
          });
          return false;
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
