import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final randomiser = Random();
  var currentDiceRoll = 2;
  void rollDice() {
    setState(() {
      currentDiceRoll = randomiser.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          height: 300,
          width: 300,
        ),
        const SizedBox(
          height: 20,
          width: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(20),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 98, 83, 139))),
            onPressed: rollDice,
            child: const Text(
              'Roll the Dice',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
