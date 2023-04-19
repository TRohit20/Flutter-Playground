import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
