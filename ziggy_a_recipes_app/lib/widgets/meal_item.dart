import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({required this.meal, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
                    children: [],
                  )
                ]),
              ))
        ]),
      ),
    );
  }
}
