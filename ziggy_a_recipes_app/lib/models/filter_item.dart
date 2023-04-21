import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  bool filterStatus;
  final String title;

  FilterItem({super.key, required this.filterStatus, required this.title});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.filterStatus,
      onChanged: (statusChange) {
        setState(() {
          widget.filterStatus = statusChange;
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Collection of meals that are ${widget.title}',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
