import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String option;
  final void Function() onTap;
  AnswerButton({required this.option, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Color.fromARGB(255, 45, 79, 95),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        option,
        textAlign: TextAlign.center,
      ),
    );
  }
}
