import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // SizedBox(
        //   height: 20,
        //   child: FittedBox(
        //     child: Text('${Numeral(spendingAmount).format()} ₺'),
        //   ),
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        SizedBox(
          height: 70,
          width: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  //rgb values this one actually light grey
                  color: const Color.fromARGB(255, 69, 217, 175),
                  //circular borders code
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // heighfactor is between 0 - 1. 1 is 100 0 is 0
              FractionallySizedBox(
                heightFactor: 1 - spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 205, 205),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                      child: Text('${Numeral(spendingAmount).format()}₺'))),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
