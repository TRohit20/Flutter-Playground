import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/models/filter_item.dart';
// import 'package:ziggy_a_recipes_app/screens/tabs.dart';
// import 'package:ziggy_a_recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  var _gluttenFilterStatus = false;
  var _lactoseFilterStatus = false;
  var _vegetarianFilterStatus = false;
  var _veganFilterStatus = false;

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
      body: Column(children: [
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
    );
  }
}
