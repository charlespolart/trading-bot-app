import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:trading_bot_app/APIRequest.dart';
import 'package:trading_bot_app/Style.dart';
import 'package:trading_bot_app/widget/PairList.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  _StatisticsViewState createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  double _total = 0.0;
  List<PairSimple> _pairs = [];

  Widget _topBar() {
    return Container(
      decoration: BoxDecoration(
        color: GColor.card,
        borderRadius: BorderRadiusDirectional.circular(6.0),
      ),
      child: Center(
        child: Text(
          "Total : ${_total.toStringAsFixed(2)}%",
        ),
      ),
    );
  }

  @override
  void initState() {
    APIRequest.getTotal().then((value) {
      setState(() {
        _total = value;
      });
    });
    APIRequest.getPairs().then((value) {
      setState(() {
        _pairs = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _topBar(),
          ),
        ),
        Expanded(
          flex: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PairList(pairs: _pairs),
          ),
        ),
      ],
    );
  }
}
