import 'package:flutter/material.dart';

class PostQuizDisplay extends StatelessWidget {
  const PostQuizDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: const Text('Wow, You answered all the questions!')),
    );
  }
}
