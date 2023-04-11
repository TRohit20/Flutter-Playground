import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Category'),
      ),
      body: const Center(
        child: Text('Recipes of this certain Category'),
      ),
    );
  }
}
