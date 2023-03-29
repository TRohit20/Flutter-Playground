import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentOfTotalAmountSpent;

  ChartBar(this.amountSpent, this.label, this.percentOfTotalAmountSpent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight *
                    0.10, // Wrapping with container and giving the height so that the text and size of Bars are aligned
                child: FittedBox(
                    child: Text('\$ ${amountSpent.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ), // Just to give some spacing
            // Actual bar that is filled fractionally acc to data
            Container(
              height: constraints.maxHeight * 0.7,
              width: 15,
              // Stack is a widget that allows you to put things on each other as in Overlap
              child: Stack(
                // the 1st widget you add here will be the bottom most widget
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(220, 220, 220, 1)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentOfTotalAmountSpent,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(10))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.10,
                child: FittedBox(child: Text(label)))
          ],
        );
      },
    );
  }
}
