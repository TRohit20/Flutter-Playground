import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback callBack;

  const Answer(this.callBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callBack,
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.amber)),
        child: const Text('Python'),
      ),
    );
  }
}
