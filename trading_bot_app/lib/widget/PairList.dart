import 'package:flutter/material.dart';

import 'package:trading_bot_app/APIRequest.dart';

class PairList extends StatelessWidget {
  PairList({required this.pairs});

  final List<PairSimple> pairs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {1: FractionColumnWidth(0.25)},
          children: [
            TableRow(
              children: [
                Text(
                  "Pair",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  "Profit",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {1: FractionColumnWidth(0.25)},
              children: pairs
                  .map((pair) => TableRow(
                        children: [
                          Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(pair.pair),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: pair.total < 0.0
                                  ? Colors.red[600]
                                  : pair.total > 0.0
                                      ? Colors.green[600]
                                      : Colors.grey,
                              borderRadius: BorderRadiusDirectional.circular(6.0),
                            ),
                            child: Center(child: Text((pair.total > 0.0 ? "+" : "") + "${pair.total.toStringAsFixed(2)}%")),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
