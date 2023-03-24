import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentOfTotalAmountSpent;

  ChartBar(this.amountSpent, this.label, this.percentOfTotalAmountSpent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$ ${amountSpent.toStringAsFixed(0)}')),
        const SizedBox(
          height: 5,
        ), // Just to give some spacing
        // Actual bar that is filled fractionally acc to data
        Container(
          height: 100,
          width: 15,
          // Stack is a widget that allows you to put things on each other as in Overlap
          child: Stack(
            // the 1st widget you add here will be the bottom most widget
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: percentOfTotalAmountSpent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
