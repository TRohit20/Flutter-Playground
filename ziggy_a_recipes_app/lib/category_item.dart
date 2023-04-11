import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color colour;

  CategoryItem(this.title, this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colour.withOpacity(0.7), colour],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
